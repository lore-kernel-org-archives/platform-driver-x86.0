From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v10 12/15] platform/x86: dell-smbios: Add filtering
 support
Date: Fri, 5 Jan 2018 12:13:13 +0100
Message-ID: <20180105111313.23c6vjs2x3fhtvi4@pali>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <2dfbb122aa11fa9ff73cbfc6a403b82d1bb2e7c8.1508434514.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:38897 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751092AbeAELNQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Jan 2018 06:13:16 -0500
Content-Disposition: inline
In-Reply-To: <2dfbb122aa11fa9ff73cbfc6a403b82d1bb2e7c8.1508434514.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

I know that this patch is already applied and merged, but I spotted this
problem:

On Thursday 19 October 2017 12:50:15 Mario Limonciello wrote:
> +/* calls that are explicitly blacklisted */
> +static struct smbios_call call_blacklist[] = {
> +	{0x0000, 01, 07}, /* manufacturing use */
> +	{0x0000, 06, 05}, /* manufacturing use */
> +	{0x0000, 11, 03}, /* write once */
> +	{0x0000, 11, 07}, /* write once */

Numbers prefixed by zero means that they are in octal notation, right?
This can lead to misunderstanding, confusion or problems in future...

Can we have all numbers either in hexadecimal or decimal notation?

> +	{0x0000, 11, 11}, /* write once */
> +	{0x0000, 19, -1}, /* diagnostics */
> +	/* handled by kernel: dell-laptop */
> +	{0x0000, CLASS_INFO, SELECT_RFKILL},
> +	{0x0000, CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT},
> +};

-- 
Pali Rohár
pali.rohar@gmail.com
