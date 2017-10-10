From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v6 10/14] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Tue, 10 Oct 2017 20:31:57 +0200
Message-ID: <20171010160131.wkaxfsevd6w2akep@pali>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <3892df796d90f3568be48b85498a7819711323db.1507589249.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:56769 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932232AbdJJScG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 14:32:06 -0400
Content-Disposition: inline
In-Reply-To: <3892df796d90f3568be48b85498a7819711323db.1507589249.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>

On Monday 09 October 2017 17:51:48 Mario Limonciello wrote:
> +static struct token_range token_blacklist[] = {
> +	{0x0000, 0x0175, 0x0176},
> +	{0x0000, 0x0195, 0x0197},
> +	{0x0000, 0x01DC, 0x01DD},
> +	{0x0000, 0x027D, 0x0284},
> +	{0x02E3, 0x0000, 0x0000},
> +	{0x02FF, 0x0000, 0x0000},
> +	{0x0000, 0x0300, 0x0302},
> +	{0x0000, 0x0325, 0x0326},
> +	{0x0000, 0x0332, 0x0335},
> +	{0x0350, 0x0000, 0x0000},
> +	{0x0363, 0x0000, 0x0000},
> +	{0x0368, 0x0000, 0x0000},
> +	{0x0000, 0x03F6, 0x03F7},
> +	{0x0000, 0x049E, 0x049F},
> +	{0x0000, 0x04A0, 0x04A3},
> +	{0x0000, 0x04E6, 0x04E7},
> +	{0x0000, 0x4000, 0x7FFF},
> +	{0x0000, 0x9000, 0x9001},
> +	{0x0000, 0xA000, 0xBFFF},
> +	{0x0000, 0xEFF0, 0xEFFF},
> +};

Hi! There should be information what is hidden in those tokens, so other
people would be able to review why are those token blacklisted.

-- 
Pali Rohár
pali.rohar@gmail.com
