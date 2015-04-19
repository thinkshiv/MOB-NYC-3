# Lesson 00 - Getting Started

This lesson is an introduction to the course and to iPhone development.

## Lesson Objectives

* Set course expectations
* Outline developer workflow and tools on a high level
* Outline the basic components of an iPhone app
* Label the Xcode IDE window
* Create the first working iOS app!

## Goals

The goals of this lesson are primarily to establish the expectations for the course and to give students a taste of what iPhone development is like. In service of this, students will _leave class with a working iPhone app_ (in the iOS Simulator) of a simple photo gallery.

Students will learn about: 

1. Xcode and Interface Builder, 
2. the four filetypes that comprise most Swift-powered iPhone apps, 
3. the workflow going between Xcode and the iOS Simulator,
4. adding Views to an iPhone interface, and
5. adding media (images) to an iPhone app.

## Lesson Plan

### Introduction

Introduction to GA and the Course by Daniel Demoray (Course Producer)

Meet the Instructors

* William Martin, Instructor
* Angel Moreno, EIR

How to use Slack

### Developer Workflow

_Goal: Compile and run an iPhone app_

* Xcode overview
* Start new Xcode project
* Brief orientation around the UI
    * Navigator Panel
    * Inspector Panel
    * Library
* Different filetypes
    * .swift
    * .storyboard
    * .xib
    * .plist
* Interface Builder is ...
    * Disable autolayout
    * Place a scrollview
    * Place a label describing the photos (e.g. "Shibas")
    * Run the app (CMD + r). Woohoo!
    * Note how it doesn't scroll
        * Set the scroll size for the scroll panel (note that this is done manually now, but with code later)
        * Run again and note how the scrolling works.
* Adding Media
    * Download photos
    * Import photo
    * Resize the photo by attributes with the Size inspector
    * Change the View Mode to "Aspect Fit" in the Attributes inspector
    * Move the photo to line up with the label (point out the guides)
    * Run the app
* Assignment
    * Place photos in a linear, grid, or brick pattern

### Review and Q+A (10min)

## Weekend Exercise: Build up the app we started

* Goal: Comfort with Xcode (mostly IB)
* Reinforce course material with corollary material from the Gitbook (2.1, 2.2)

