From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 8/8] asus-wmi: Don't register rfkill if ASHS and user
 bit are present
Date: Thu, 26 Jan 2017 14:45:41 -0800
Message-ID: <1485470741.12563.104.camel@perches.com>
References: <20170126153013.12753-1-jprvita@endlessm.com>
         <20170126153013.12753-9-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay0095.hostedemail.com ([216.40.44.95]:32887 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752169AbdAZWsN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Jan 2017 17:48:13 -0500
In-Reply-To: <20170126153013.12753-9-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?ISO-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?ISO-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>

On Thu, 2017-01-26 at 10:30 -0500, João Paulo Rechi Vita wrote:
> Some Asus laptops that have an airplane-mode indicator LED, also have
> the WMI WLAN user bit set, and the following bits in their DSDT:

style trivia:

> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
[]
> @@ -2051,6 +2052,16 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
>  	return 0;
>  }
>  
> +static bool ashs_present(void)
> +{
> +	int i;
> +
> +	for (i = 0; strcmp(asus_wireless_ids[i].id, ""); i++)
> +		if (acpi_dev_found(asus_wireless_ids[i].id))
> +			return true;

The for loop would commonly have braces because of the
internal if.
