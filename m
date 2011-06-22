From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 3/3] ideapad: add backlight driver
Date: Wed, 22 Jun 2011 20:40:49 +0100
Message-ID: <20110622194049.GB8861@srcf.ucam.org>
References: <1308729781-2590-1-git-send-email-ike.pan@canonical.com>
 <1308730058-2703-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:42043 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758211Ab1FVTk6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2011 15:40:58 -0400
Content-Disposition: inline
In-Reply-To: <1308730058-2703-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, Richard Purdie <rpurdie@rpsys.net>

On Wed, Jun 22, 2011 at 04:07:38PM +0800, Ike Panhc wrote:

> -static void ideapad_sync_rfk_state(struct acpi_device *adevice)
> +static void ideapad_sync_rfk_state(struct ideapad_private *priv)
>  {

This should be a separate patch.

> -static void __devexit ideapad_unregister_rfkill(struct acpi_device *adevice,
> -						int dev)
> +static void ideapad_unregister_rfkill(struct acpi_device *adevice, int dev)

This also seems unrelated.

> +static int ideapad_backlight_get_brightness(struct backlight_device *blightdev)
> +{
> +	unsigned long now;
> +
> +	if (read_ec_data(ideapad_handle, 0x12, &now))
> +		return -EAGAIN;

Description says you're using commands on the VPC2004 device, but it 
looks like you're just poking the embedded controller? Are you sure the 
EC offsets are stable?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
