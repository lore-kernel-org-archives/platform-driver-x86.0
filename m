From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 04/16] asus-wmi: Enable autorepeat for hotkey input
 device
Date: Fri, 1 Jul 2011 15:15:58 +0100
Message-ID: <20110701141558.GB1363@srcf.ucam.org>
References: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
 <1309512881-2901-5-git-send-email-corentin.chary@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:55179 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756598Ab1GAOQG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 10:16:06 -0400
Content-Disposition: inline
In-Reply-To: <1309512881-2901-5-git-send-email-corentin.chary@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>, Corentin Chary <corentincj@iksaif.net>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user@lists.sourceforge.net>, open list <linux-kernel@vger.kernel.org>

On Fri, Jul 01, 2011 at 11:34:29AM +0200, Corentin Chary wrote:
>  	asus->inputdev->id.bustype = BUS_HOST;
>  	asus->inputdev->dev.parent = &asus->platform_device->dev;
> +	__set_bit(EV_REP, asus->inputdev->evbit);

set_bit()? I guess it doesn't make much difference in this case, it just 
seems neater to use the non __ version.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
