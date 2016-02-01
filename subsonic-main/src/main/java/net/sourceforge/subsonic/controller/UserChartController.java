/*
 This file is part of Subsonic.

 Subsonic is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Subsonic is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Subsonic.  If not, see <http://www.gnu.org/licenses/>.

 Copyright 2009 (C) Sindre Mehus
 */
package net.sourceforge.subsonic.controller;

import java.awt.Color;
import java.awt.GradientPaint;
import java.awt.Paint;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.AxisLocation;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.LogarithmicAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.StandardBarPainter;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.web.servlet.ModelAndView;

import net.sourceforge.subsonic.domain.User;
import net.sourceforge.subsonic.service.SecurityService;

/**
 * Controller for generating a chart showing bitrate vs time.
 *
 * @author Sindre Mehus
 */
public class UserChartController extends AbstractChartController {

    private SecurityService securityService;

    public static final int IMAGE_WIDTH = 400;
    public static final int IMAGE_MIN_HEIGHT = 200;
    private static final long BYTES_PER_MB = 1024L * 1024L;

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String type = request.getParameter("type");
        CategoryDataset dataset = createDataset(type);
        JFreeChart chart = createChart(dataset, request);

        int imageHeight = Math.max(IMAGE_MIN_HEIGHT, 15 * dataset.getColumnCount());

        ChartUtilities.writeChartAsPNG(response.getOutputStream(), chart, IMAGE_WIDTH, imageHeight);
        return null;
    }

    private CategoryDataset createDataset(String type) {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        List<User> users = securityService.getAllUsers();
        for (User user : users) {
            double value;
            if ("stream".equals(type)) {
                value = user.getBytesStreamed();
            } else if ("download".equals(type)) {
                value = user.getBytesDownloaded();
            } else if ("upload".equals(type)) {
                value = user.getBytesUploaded();
            } else if ("total".equals(type)) {
                value = user.getBytesStreamed() + user.getBytesDownloaded() + user.getBytesUploaded();
            } else {
                throw new RuntimeException("Illegal chart type: " + type);
            }

            value /= BYTES_PER_MB;
            dataset.addValue(value, "Series", user.getUsername());
        }

        return dataset;
    }

    private JFreeChart createChart(CategoryDataset dataset, HttpServletRequest request) {
        
    	JFreeChart chart = ChartFactory.createBarChart(null, null, null, dataset, PlotOrientation.HORIZONTAL, false, false, false);

        CategoryPlot plot = chart.getCategoryPlot();
        ((BarRenderer) plot.getRenderer()).setBarPainter(new StandardBarPainter());
        Paint background = new GradientPaint(0, 0, new Color(0xBAD7E3), 0, IMAGE_MIN_HEIGHT, new Color(0xBAD7E3));
        plot.setBackgroundPaint(background);
        plot.setDomainGridlinePaint(new Color(0xBAD7E3));
        plot.setDomainGridlinesVisible(true);
        plot.setRangeGridlinePaint(new Color(0xBAD7E3));
        plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_LEFT);

        LogarithmicAxis rangeAxis = new LogarithmicAxis(null);
        rangeAxis.setStrictValuesFlag(false);
        rangeAxis.setAllowNegativesFlag(true);
        plot.setRangeAxis(rangeAxis);

        // Disable bar outlines.
        BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setDrawBarOutline(false);
        
        // Disable bar shadows
        renderer.setShadowVisible(false);
        
        // Set up gradient paint for series.
        GradientPaint gp0 = new GradientPaint(
                0.0f, 0.0f, new Color(0x3284A8),
                0.0f, 0.0f, new Color(0x3284A8)
        );
        renderer.setSeriesPaint(0, gp0);

        // Rotate labels.
        CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(Math.PI / 6.0));

        // Set theme-specific colors.
        Color bgColor = getBackground(request);
        Color fgColor = getForeground(request);

        chart.setBackgroundPaint(bgColor);

        domainAxis.setTickLabelPaint(fgColor);
        domainAxis.setTickMarkPaint(fgColor);
        domainAxis.setAxisLinePaint(fgColor);

        rangeAxis.setTickLabelPaint(fgColor);
        rangeAxis.setTickMarkPaint(fgColor);
        rangeAxis.setAxisLinePaint(fgColor);

        return chart;
    }

    public void setSecurityService(SecurityService securityService) {
        this.securityService = securityService;
    }
}
