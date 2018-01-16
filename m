From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v8 3/3] platform/mellanox: mlxreg-hotplug: modify to use
 regmap intreface
Date: Mon, 15 Jan 2018 19:43:34 -0800
Message-ID: <20180116034334.GD4590@fury>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <1515661123-76604-4-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:60342 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751015AbeAPDng (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jan 2018 22:43:36 -0500
Content-Disposition: inline
In-Reply-To: <1515661123-76604-4-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Thu, Jan 11, 2018 at 08:58:43AM +0000, Vadim Pasternak wrote:
> It includes:
> - restructuring  of mlxreg header file for unification of hotplug items
>   definition;
> - unification of hotplug items to allow any kind of item (power
>   controller, fan eeprom, psu eeprom, asic health in common way);
> - utilization of regmap interface to allow independency of underlying
>   hardware. It allows to support hotplug event functionality over
>   programmable devices logic, when these devices can be attached to
>   different interfaces types, like I2C, LPC, SPI.

This was honestly very difficult to review. This really should be several
patches which each do clearly defined things for the sake of the review process.
Doing all of the above, plus the addition of several superfluous changes for
coding style (which aren't noted above) make it very difficult to track
everything that is going on. Incremental changes lead to better code review,
fewer unintentional changes, and better code overall.

-- 
Darren Hart
VMware Open Source Technology Center
