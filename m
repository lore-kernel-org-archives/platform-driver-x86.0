From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v10 11/15] platform/x86: dell-smbios-smm: test for WSMT
Date: Thu, 19 Oct 2017 20:09:26 +0200
Message-ID: <20171019180926.h6lnfwnapswybtcb@pali>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <657d281490de3d0a60f210f8bc57e075c9afc40e.1508434514.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:50524 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753365AbdJSSJ3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2017 14:09:29 -0400
Content-Disposition: inline
In-Reply-To: <657d281490de3d0a60f210f8bc57e075c9afc40e.1508434514.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

On Thursday 19 October 2017 12:50:14 Mario Limonciello wrote:
> +/* When enabled this indicates that SMM won't work */
> +static bool test_wsmt_enabled(void)
> +{
> +	struct calling_interface_token *token;
> +
> +	/* if token doesn't exist, SMM will work */
> +	token = dell_smbios_find_token(WSMT_EN_TOKEN);
> +	if (!token)
> +		return false;
> +
> +	/* if token exists, try to access over SMM */
> +	buffer->class = CLASS_TOKEN_READ;
> +	buffer->select = SELECT_TOKEN_STD;
> +	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> +	buffer->input[0] = token->location;
> +	dell_smbios_smm_call(buffer);
> +
> +	/* if lookup failed, we know WSMT was enabled */
> +	if (buffer->output[0] != 0)
> +		return true;
> +
> +	/* query token status if it didn't fail */
> +	return (buffer->output[1] == token->value);
> +}
> +
>  static int __init dell_smbios_smm_init(void)
>  {
>  	int ret;
> @@ -115,6 +140,13 @@ static int __init dell_smbios_smm_init(void)
>  
>  	dmi_walk(find_cmd_address, NULL);
>  
> +	ret = test_wsmt_enabled();

ret is int, but test_wsmt_enabled() returns bool.

-- 
Pali Rohár
pali.rohar@gmail.com
