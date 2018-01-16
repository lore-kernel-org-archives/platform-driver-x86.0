From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v8 0/3] drivers/platform: replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Mon, 15 Jan 2018 20:02:15 -0800
Message-ID: <20180116040215.GH4590@fury>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <20180116034209.GA4590@fury>
 <20180116034606.GF4590@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48244 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751142AbeAPECR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jan 2018 23:02:17 -0500
Content-Disposition: inline
In-Reply-To: <20180116034606.GF4590@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Mon, Jan 15, 2018 at 07:46:06PM -0800, Darren Hart wrote:
> On Mon, Jan 15, 2018 at 07:42:09PM -0800, Darren Hart wrote:
> > To follow this email, are two patches which are minor incremental
> > cleanups, which I'd appreciate your review of before I push them to
> > testing.
> 
> 
> From ccfc9b138034b5ccd89da1d938e9241eaeb4dabf Mon Sep 17 00:00:00 2001
> Message-Id: <ccfc9b138034b5ccd89da1d938e9241eaeb4dabf.1516073719.git.dvhart@infradead.org>
> In-Reply-To: <2c5d26ee913e0f5f7d13c559d85e8da7e4ddcdab.1516073719.git.dvhart@infradead.org>
> References: <2c5d26ee913e0f5f7d13c559d85e8da7e4ddcdab.1516073719.git.dvhart@infradead.org>
> From: "Darren Hart (VMware)" <dvhart@infradead.org>
> Date: Mon, 15 Jan 2018 19:28:10 -0800
> Subject: [PATCH 2/2] platform/mellanox: mlxreg-hotplug: Cleanup local variable
>  declarations

The v8 series with updated commit messages and my two patches are also available
here to fetch if useful:

http://git.infradead.org/linux-platform-drivers-x86.git/shortlog/refs/heads/review-dvhart

2 of 3 needs an improved commit message still.

-- 
Darren Hart
VMware Open Source Technology Center
