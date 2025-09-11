Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426AC1F4E34
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 14:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757600294; cv=none; b=UJINcVyj/83OsFaCyCcrUb74JdDJ2MNXGKCaVa39fmaWXz7N7qs6jWe/YO067CiwUFjnLXNqGZIpppUwecFPPItxEJAzLTFS7+XCtzNhun20ihPHDwdrh37vyyqomcdAFsoNxjrypu+lrgcoMLuXT+8xyNdifl26cuxYIfBAjDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757600294; c=relaxed/simple;
	bh=P+ekWSl6BBa+CStulHQMxssqwBzzkBz3JggX4x3K5Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uNNHRNoIZaQiHlsiSZcdd7iwkzW+koLm2fok0D2D2zPa5I6AiVC8UyfALCGngn8WjOufJ/KgEBM5czrktgErzuFcfPy/UZyJ8Urancrd5nhC0M5JlL9+Ls96UI0dWOYvce8ZtG2OVifYJwZo6Uc+nil4xbt03zYByX5v/79Z63E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNjywTyf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNjywTyf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3D1C4CEF0;
	Thu, 11 Sep 2025 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757600293;
	bh=P+ekWSl6BBa+CStulHQMxssqwBzzkBz3JggX4x3K5Qc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=lNjywTyfpo8fApKPe4nd8CQ8j2qbIgK/1CUVHXNZRdsL+TDMcYBj8m28eQu/EC+aY
	 tWKqhrVr2xXlOUl/uPXOn9mTFSxFIsRneeS0LwLAtNZ8L1pwgf16Se2ToGfiXGlKgS
	 0aK/0y/CZUTlI4iBk5GXtWoTI3fpUf0C4749XtybLqNAl/Q1LG3cAEQz0JZDIpNuNs
	 ySm25Kx4cBxLVnow4oW+gNxv8kEgephMHZnuQOdh8nQn5IqcPXfxW6U5GSHHE6ShJ0
	 ePJSpDecoNLB/mMKmxVCrnPnL4gryRG1tV0Dg6NkPhuRQRrswbDKa0MdTuHlpAFQES
	 ULeK/n6D58WeA==
Message-ID: <321a7ad0-03e1-4a73-a0b3-e9f9ecf2c7d5@kernel.org>
Date: Thu, 11 Sep 2025 16:18:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: lenovo: Reassign KEY_CUT to
 KEY_SELECTIVE_SCREENSHOT for Ideapad laptops
To: =?UTF-8?B?VG9tw6HFoSBIbnlr?= <tomashnyk@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <1757599473382.2879968666.2275695113@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <1757599473382.2879968666.2275695113@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11-Sep-25 4:13 PM, Tomáš Hnyk wrote:
> This key is produced by FN+PRINT_SCREEN and as per Lenovo documentation,
> it should be "Open the Snipping tool". This corresponds to
> KEY_SELECTIVE_SCRENSHOT, whose keycode is 0x27a. Previously, keycodes
> under 248 were preferred due to X11 limitations, so KEY_CUT was used.
> This is now being corrected.
> 
> Signed-off-by: Tomáš Hnyk <tomashnyk@gmail.com>
> ---
>  Fixes https://bugzilla.kernel.org/show_bug.cgi?id=220566

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans





>  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index fcebfbaf0460..556d50fb7996 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1328,7 +1328,7 @@ static const struct key_entry ideapad_keymap[] = {
>     /* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
>     { KE_KEY,   0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
>     /* shift + prtsc */
> -   { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> +   { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
>     { KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
>     { KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
> 

