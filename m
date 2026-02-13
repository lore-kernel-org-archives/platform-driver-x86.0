Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76D16CD33;
	Fri, 13 Feb 2026 16:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771001665; cv=none; b=qVsX25wuLjZ2RLiN/Rue8XkkcVIMSzZwh+nKP54mJp8t0NoPi7+OsOF4j+AhEsyRdBeFzQIiLCb/ZRl6kKIwMHiTLt4iBcgLoNNivdTO+AAxQ0YatBqx8sX3IlAkvA2X4kATxR61/JWlX9BuntgNTuwJrxFuo53ul+exzmg6d+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771001665; c=relaxed/simple;
	bh=Qn8/iSLa1BFVZO3aUiXhPAL9i05+CEivLw+cpGHSaSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6/Kjrsodi4eZJUnCv68IdAzlXR+l3tpnQyFam7+GnsnivO1G1YiHshs2ozr/2sgZwUNyljJHNxLPILouyeoCjFOp5onCYsmG5queFi8Rvjs3K2iFhkbAhP7CuApSGubwhmPOAf75WfkDNgeS0BRqoQ9vo7Nfb2oCuZT+rAQwVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HB9GO8Id; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HB9GO8Id"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA112C116C6;
	Fri, 13 Feb 2026 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771001664;
	bh=Qn8/iSLa1BFVZO3aUiXhPAL9i05+CEivLw+cpGHSaSw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HB9GO8IdYtMLcXc+zBwk7syv5wE9DnBLW7n0vEuJFpRqEzuXDevj/M4rsKvNCVgLC
	 +UKGr+ksn8LTcBqNgPPm/y1K6tXHwmKunUMKC5DtCvcVizUG1gmGy5CtmLtdq/eHIv
	 OkXV2GYSndylo6Yg5Ol5Nb+L5lQDqoUqiJVZ1+bYf4X3c33mRzGS/GlpdsNctD0+fF
	 qFathlg/AVkCOL8clBxAy8y0Mhms4e3a+5dzjqnSK72PggU6zs0iPgF7nvyTmUokUa
	 Y3wyL4JrirfTFn1eSNctAAuXrmPW5RAZyUoHW0b5qXwNqAstL5ZVhwFXAjoQ1Cbme5
	 U0B5ILx2N+T9g==
Message-ID: <21babe2b-89ed-419c-ac08-e9130ba576b4@kernel.org>
Date: Fri, 13 Feb 2026 17:54:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to
 dmi_vgbs_allow_list
To: Peter Metz <peter.metz@unarin.com>, alexhung@gmail.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213044627.203638-1-peter.metz@unarin.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260213044627.203638-1-peter.metz@unarin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Feb-26 05:46, Peter Metz wrote:
> The Dell 14 Plus 2-in-1 (model DB04250) requires the VGBS allow list
> entry to correctly enable the tablet mode switch. Without this, the
> chassis state is not reported, and the hinge rotation only emits
> unknown scancodes.
> 
> Verified on Dell 14 Plus 2-in-1 DB04250.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221090
> Signed-off-by: Peter Metz <peter.metz@unarin.com>

p.s.

If you feel up to it, there is a similar bug-report of a related
Dell model here:

https://lore.kernel.org/platform-driver-x86/CAP3yi-BWm0LqkhfzTrGy5n-KQ=3+T8eRMoR+Z+7Ke2VJB43kTA@mail.gmail.com/

it would be great if you can write a follow-up patch fixing
that one too.

Regards,

Hans



> ---
>  drivers/platform/x86/intel/hid.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 560cc0631..5b475a096 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -189,6 +189,12 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Rugged 12 Tablet RA02260"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14 Plus 2-in-1 DB04250"),
> +		},
> +	},
>  	{ }
>  };
>  

