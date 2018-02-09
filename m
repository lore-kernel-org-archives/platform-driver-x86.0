From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v1 4/4] platform/x86: mlx-platform: Add support for new
 Mellanox systems
Date: Thu, 8 Feb 2018 18:21:16 -0800
Message-ID: <20180209022116.GA25898@fury>
References: <1517561148-38587-1-git-send-email-vadimp@mellanox.com>
 <1517561148-38587-5-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43983 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752103AbeBICVV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Feb 2018 21:21:21 -0500
Content-Disposition: inline
In-Reply-To: <1517561148-38587-5-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Fri, Feb 02, 2018 at 08:45:48AM +0000, Vadim Pasternak wrote:
> Add support for the next new Mellanox system types: msn274x, msn201x,
> qmb7, sn34, sn37. The current members of these types are:

Please break this up into one patch per system type, or a similar logical
breakdown.

-- 
Darren Hart
VMware Open Source Technology Center
