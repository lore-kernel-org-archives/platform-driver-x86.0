From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: Add WMI driver for controlling AlienFX features on some Alienware
 products
Date: Wed, 09 Apr 2014 10:50:49 -0500
Message-ID: <53456C59.9080300@dell.com>
References: <20140409152001.GA24536@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:46542 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933129AbaDIPvC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Apr 2014 11:51:02 -0400
In-Reply-To: <20140409152001.GA24536@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>


On 04/09/2014 10:20 AM, Dan Carpenter wrote:
> Hello Mario Limonciello,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch d17a5ee12973: "Add WMI driver for controlling AlienFX
> features on some Alienware products" from Apr 4, 2014, leads to the
> following Smatch complaint:
>
> drivers/platform/x86/alienware-wmi.c:551 alienware_wmi_exit()
> 	 warn: variable dereferenced before check 'platform_device' (see line 549)
>
> drivers/platform/x86/alienware-wmi.c
>     548	{
>     549		alienware_zone_exit(platform_device);
>                                      ^^^^^^^^^^^^^^^
>     550		remove_hdmi(platform_device);
>                              ^^^^^^^^^^^^^^^
>     551		if (platform_device) {
>                      ^^^^^^^^^^^^^^^
>     552			platform_device_unregister(platform_device);
>     553			platform_driver_unregister(&platform_driver);
>
> regards,
> dan carpenter
Hi Dan,

Thanks for letting me know.  I did submit a follow up patch for this behavior here a few days ago:

http://www.spinics.net/lists/platform-driver-x86/msg05233.html

Thanks,
