From: Marco Martin <notmart@gmail.com>
Subject: Re: [PATCH] Support tablet mode switch for Dell laptops
Date: Thu, 18 Jan 2018 16:59:40 +0100
Message-ID: <CAD6_BouNzAn_BDWNVYDoBNo5Cdh+taWx4uVF6amZWFPvK4Q6BA@mail.gmail.com>
References: <1516283990-3665-1-git-send-email-notmart@gmail.com>
 <CAHp75VcKgRCjqw0U=F3ez1XaMdY+e0oVRWvrjWxNyADv8+tsKA@mail.gmail.com> <2125c5fc4eba44e5929600d3fbc0d456@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:34471 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932699AbeARP7l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Jan 2018 10:59:41 -0500
In-Reply-To: <2125c5fc4eba44e5929600d3fbc0d456@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, Bhushan Shah <bhush94@gmail.com>, platform-driver-x86@vger.kernel.org

On Thu, Jan 18, 2018 at 4:23 PM,  <Mario.Limonciello@dell.com> wrote:
> AFAIK we don't have a public specification for the ACPI interface
> that intel-vbtn uses, it's all reverse engineered.
>
> I think the appropriate thing to do would be open a kernel Bugzilla for your
> issue and attach:
> 1) kernel log without your patch (do you get unknown event index?)
> 2) your DSDT there to review.
>
> You can subscribe us to it.

done at
https://bugzilla.kernel.org/show_bug.cgi?id=198507
