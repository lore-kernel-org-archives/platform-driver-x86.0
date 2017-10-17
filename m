From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 11/17] platform/x86: dell-smbios-smm: test for WSMT
Date: Tue, 17 Oct 2017 21:22:58 +0200
Message-ID: <20171017192258.fx2ejggjkyzkrzle@pali>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <e552ba67da7281d184936a551501c4040510b372.1508259916.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:44503 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937588AbdJQTXB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 15:23:01 -0400
Content-Disposition: inline
In-Reply-To: <e552ba67da7281d184936a551501c4040510b372.1508259916.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

On Tuesday 17 October 2017 13:21:55 Mario Limonciello wrote:
> +/* When enabled this indicates that SMM won't work */
> +static int test_wsmt_enabled(void)
> +{
> +	struct calling_interface_token *token;
> +
> +	/* if token doesn't exist, SMM will work */
> +	token = dell_smbios_find_token(WSMT_EN_TOKEN);
> +	if (!token)
> +		return 0;
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
> +		return 1;
> +
> +	/* query token status if it didn't fail */
> +	return (buffer->output[1] == token->value);
> +}

Maybe small suggestion... function returns only zero or one -- what is a
good candidate to have return value boolean and not basic int.

-- 
Pali Rohár
pali.rohar@gmail.com
