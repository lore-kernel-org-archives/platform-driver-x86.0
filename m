From: Axel Lin <axel.lin@gmail.com>
Subject: Re: [PATCH] eeepc-laptop: fix hotplug_disabled module_param
	permissions
Date: Fri, 23 Jul 2010 08:45:39 +0800
Message-ID: <AANLkTingKYmfwx9ASUCvxn08OAEjnhyLFGUHHxgRBNBw@mail.gmail.com>
References: <1278897325.6563.7.camel@mola> <20100722151106.GD25002@srcf.ucam.org>
Reply-To: axel.lin@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:39298 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755808Ab0GWAqH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Jul 2010 20:46:07 -0400
In-Reply-To: <20100722151106.GD25002@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

2010/7/22 Matthew Garrett <mjg59@srcf.ucam.org>:
> I think I've got all of your patches merged now, but let me know if I've
> missed any. They should be in my linux-next branch.

hi Matthew,
Thanks for merging the patches.

Below 3 patches are missing:
[PATCH] asus-laptop: fix asus_input_init error path
        http://lkml.org/lkml/2010/7/5/21
[PATCH] dell-laptop: make dell_laptop_i8042_filter() static
        http://lkml.org/lkml/2010/7/5/69
[PATCH] msi-wmi: make needlessly global symbols static
        http://lkml.org/lkml/2010/7/8/66

Regards,
Axel
