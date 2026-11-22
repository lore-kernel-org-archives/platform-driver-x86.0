Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370376;
	b=E5TATb+3EllwWVoFW8MmyIWX51bIIRbXZG9XC+R5tiR5PYN79/+Fl4s4ysNdyAdAplr8
	 sMKPHcYLCiMvwNHNISohyGkquGpEbP/U/0OrN+tCNCQR6R2iolrYRataZRYPKqwGQWjST
	 5MGTUL2DaP/+QTQOOrxJ7EcxsGB96TS4rw92McwEPsVB7TlEVei0MajqVWntVJyjNMrcj
	 P7GGSnQIYLmCMZqau0eEixbQ8wSbz/DlXBxBMqAMdYqa8Kcz7pnosE76wqwO5RBfiWLmD
	 XhVQwnG979zgAAh7trJWTgF0yRm7A3bNzNd7es1HEg68ztvYgh9upODcK5cikHZD7LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kRG8CHsOFvzuA+tHkN4sv4XPLOr4+r/vBSrY1/yx2Nw=;
	b=Rg3VSsKpDHHQkR4A7Zv6o77yYoJDWs/XNr5rtgaOdyYtqdBcRVLjeEdgYZTRcr6oNgPU
	 29mKEzfJgrgSA9AaKL83ZTNDUsTovz741s7rgmTxKNWJqs58o0C0R1ZMgPIgpafbzm1UA
	 8DmR08PLgzFeZS6xE6HRRpevOTU3xI+VOsr0P95XH3SqpBbS94O6X7O4XcSGfQKjRB+PB
	 drmwtdCwEoV/HjHP2de8kQbebdaVPvKrweJF+IyBpe1CeZ+A1OMwelwuNMlVHqVM/s2QJ
	 FTPqKlK/oJGiFGed/YDY+ANenhDCJP199xV3PdGvNcJ2AOrKH9YkJhW1LL89IPMHH3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVJ5rxXq;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EBA606A32A
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 17:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06EBA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVJ5rxXq
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40312e2so6107330eec.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 09:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370375; x=1795975175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kRG8CHsOFvzuA+tHkN4sv4XPLOr4+r/vBSrY1/yx2Nw=;
        b=qVJ5rxXqnS1fjgjpNp27xj5ZpmGhDJHHUxsU/JQcEVQwffiESTTdoknttaATciXmpe
         StsjSRH3B0sokcr5x5thT6B0cyQFRNIsqQ4h+w3N33c3ftRucp9X0N2bO7goWi0/4WY+
         7PEDc9NY0UPJtEuuCcLVIHzreMnMp4rI/vWQex3QjNmEPmMyZ0wWa+IyPQvd7hpDmJMw
         9HTOEdhufNe1uza7HWFBUC84H2A0iFjVIuqoogxkuQERLH8L3m/GDSsUE5Cr15MF2IZ6
         3RYF1x0p8TrhRb5dQXvVAVod2gzAfO2a/g7V2cK0qla5u/WwNOVWLsr6MS5oZ8NazMx+
         vNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370375; x=1795975175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRG8CHsOFvzuA+tHkN4sv4XPLOr4+r/vBSrY1/yx2Nw=;
        b=0xhwZY/DeQIzVqIu0AOUcrm0qi+QtsSb726MJgBCJwY47IXcuZvvWn/KpkFDB94VUR
         6Narb6+zjNAeuZAbGd4zDz9RTi9N0SmXb+unPCpWq7k3lYpvHS9weTit1qE10hNGFo0/
         8uX7kwf6vBJnWnOHTvYgIsKotZcZ22jUNAgDupBaxAlsk7mBliUP0UyjnlYv/f6QYUv7
         paERmIFzH6VaVbfjt8U9VfjnPODCUgJFi7MIfJ+cuDJp9HNR3JGyVwNSSLVIO3DdlMqg
         0LGOFBF3N2OPSdvgdSV3N8WZHzk+MqZT04wp9OQMU26AQ2e6nEE6TImM+dbIiKKD9lQV
         S2zA==
X-Gm-Message-State: APuU4Z+LOf1B5Y6InQdJcHIXPX196sWX5h9217BfQa7rqtUChjLTFzdS
	VysONlJpKHpIMZJlC5b9J0nhuo0LYfoINGuLHGDiYniCwlVK+Jre/Vbs
X-Gm-Gg: AZFdTZeS6lg0+QBw9fZ+HP7d4p1mqSuJlVxkplvMHpqFxEUFmS/iAx3GaiIU0P4IOxI
	mR33OND+lczUv+55W0jhqjH7T+yNA7JMnzxJ54JPs6LRtNCI7wOYqolfn3RCfCudkn+GvhrTdqU
	RQQKFzcqijPG2cXYlog24g3gOFVz38um1hG4tESJ3pMOT3izbRXwr+lol0br5bpMGoVjBSBAAK/
	A970fIQYRxEMojpNXhF++l3+QuHD3jg0K6qZHX0ic28l+0zQRFZLgl5riHyZjf+tfC4Wttal0zu
	wGTXqxuGkUf3I2EZkba7Ru+iaXXdmMb/x5p5zFklLMXqarMPl89zKy7qHD2tRYlWCqmEAEfqfT5
	Zrxwiy2rERyU+zQdzsORsY4FGKrvJ2jOvbkBtLVxn2qeYx/sRBuMBAOcVajvP8xCfREy0agi1EK
	iATeQ1v1Ostx64aUZkjN7pU7lhhKMWieFWeHdLwAotkbHs3Y0lGW+6GtSM86JZbjIO4xGDBKw13
	LxA3k99KxDBOKxcCDLfgCXlC87k4IILJWrLxIKqD29m5IwmJVL0pZZu/CtKJpZotDwrS0cBBDpe
	b71w+5Pd9lwe5uEx5IeEnS60qcUQfM+hYJr7maGKCPRa29/odhFcaqwVPgsqWFZRyIyDisotIJl
	wclqk2dmc1DB5fCDVUZVH/Q==
X-Received: by 2002:a05:7300:f68e:b0:369:f291:49da with SMTP id 5a478bee46e88-38571814b1dmr9847720eec.40.1795370374954;
        Sun, 22 Nov 2026 09:59:34 -0800 (PST)
Received: from archlinux ([2405:201:1b:2287:f57:f0d3:878f:6f93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29194449eec.12.2026.11.22.09.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:59:34 -0800 (PST)
Date: Sun, 22 Nov 2026 23:29:12 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: David William Richmond Davies-Jones <david@exultantmonkey.co.uk>
Cc: platform-driver-x86@vger.kernel.org, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: Enable cTGP in performance mode on
 OMEN 15-en1xxx
Message-ID: <awMir9K1nuO772x4@archlinux>
References: <20261030005724.84507-1-david@exultantmonkey.co.uk>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20261030005724.84507-1-david@exultantmonkey.co.uk>

Hi David,

Thanks for sending the patch.

On Fri, Oct 30, 2026 at 12:57:24AM +0000, David William Richmond Davies-Jones wrote:
> On the OMEN 15-en1xxx (board 88D2) the GPU power limit stays at its
> 80 W default in every platform profile, including performance.
>
> The firmware's SET_PERFORMANCE_MODE handler (GM1A in the DSDT) stores
> the mode byte in EC register 0x95 (HPCM) and enables NVIDIA cTGP through
> the NPCF device only when that byte is 0x01:
>
> 	If ((HPCM == One)) { NPCF.CTGP = One ... }
> 	Else { NPCF.CTGP = Zero ... }
>
> 0x01 is the thermal policy v0 performance value. This board reports
> policy v1 (byte 3 of GET_SYSTEM_DESIGN_DATA is 1), so the driver sends
> 0x31 for performance and cTGP is never enabled. NPCF only reports the
> cTGP offset to nvidia-powerd (ACBT = 0xA0, i.e. +20 W) when CTGP is set.

This is interesting because the patch does not make any changes to the
HPWMI_SET_PERFORMANCE_MODE path. So, if I'm following correctly, the
call tree would roughly look like this:
platform_profile_omen_set()
   platform_profile_omen_set_ec()
     omen_get_thermal_policy_version()		(you say this returns 1)
       switch-case (performance) => tp = HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE
       omen_thermal_profile_set(0x31)

So perhaps policy v1 is not entirely wrong? The HPCM == 1 check in GM1A
only tells us how this particular method handles the performance mode
value. Have you checked the other consumers of HPCM, particularly GM22
and the NVIDIA-related SSDT methods? They may interpret the v1 value
(0x31) differently. Given that the firmware reports thermal policy v1,
I'd be hesitant to conclude that it is incorrect based solely on this
check.

> For boards in a new omen_ctgp_boards[] list, set cTGP explicitly with
> SET_GPU_THERMAL_MODES after setting the profile: enabled in performance,
> disabled otherwise, with Dynamic Boost (PPAB) left enabled. The Victus S
> code already uses this command. platform_profile_omen_set_ec() is also
> called at probe time and when AC power returns, so cTGP follows the
> profile in those cases too.

The diff follows Victus S code consistently. However, have you considered
adding an entry to hp_wmi_feature_boards[] and using the corresponding
omen_v1_legacy_thermal_params mapping instead? I'd prefer reusing
the existing feature-board handling rather than introducing another
board-specific list for functionality that already has an implementation.

If I'm not mistaken, board 88D2 should also support fan curves, right? By
keeping the board ID in omen_thermal_profile_boards[], wouldn't you also
be missing the manual PWM mode support?

> A report for the Victus 16 board 8934 shows the same HPCM check in its
> GM1A method, so other v1 boards may be affected. Only 88D2 has been
> tested, hence the list.
>
> Tested on an OMEN Laptop 15-en1xxx (board 88D2, BIOS F.20, RTX 3070
> Laptop GPU) on AC: nvidia-smi reports a 100 W power limit in
> performance and 80 W in balanced and cool. Without this change it
> reports 80 W in every profile.
>
> The firmware analysis and this patch were prepared with the help of an
> AI coding assistant (Claude Opus 5.5 in Claude Code). The result was
> reviewed and tested on the hardware by the submitter.
>
> Link: https://lore.kernel.org/platform-driver-x86/CA+LW3S2g4E971by7WhfFZGuyLT47141_Zn+eJ=wyqxB_+4G95A@mail.gmail.com/
> Fixes: 286e937efbc7 ("platform/x86: hp-wmi: support omen thermal profile policy v1")
> Cc: stable@vger.kernel.org
> Signed-off-by: David William Richmond Davies-Jones <david@exultantmonkey.co.uk>
> ---
> drivers/platform/x86/hp/hp-wmi.c | 34 ++++++++++++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 52077833ac89..e09a6d261144 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -235,6 +235,14 @@ static const char * const omen_timed_thermal_profile_boards[] = {
> 	"8BAD",
> };
>
> +/* DMI board names of Omen laptops whose firmware only enables NVIDIA cTGP
> + * from SET_PERFORMANCE_MODE for the v0 performance value. With v1 values cTGP
> + * stays disabled, so it has to be set with SET_GPU_THERMAL_MODES instead.
> + */
> +static const char * const omen_ctgp_boards[] = {
> +	"88D2",
> +};
> +
> /* DMI Board names of Victus 16-d and 16-e laptops */
> static const char * const victus_thermal_profile_boards[] = {
> 	"88EE",
> @@ -2035,6 +2043,17 @@ static bool has_omen_thermal_profile_ec_timer(void)
> 			    board_name) >= 0;
> }
>
> +static bool has_omen_ctgp_control(void)
> +{
> +	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +	if (!board_name)
> +		return false;
> +
> +	return match_string(omen_ctgp_boards, ARRAY_SIZE(omen_ctgp_boards),
> +			    board_name) >= 0;
> +}
> +
> inline int omen_thermal_profile_ec_flags_set(enum hp_thermal_profile_omen_flags flags)
> {
> 	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET, flags);
> @@ -2045,6 +2064,10 @@ inline int omen_thermal_profile_ec_timer_set(u8 value)
> 	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
> }
>
> +static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
> +					    bool ppab_enable,
> +					    u8 dstate);
> +
> static int platform_profile_omen_set_ec(enum platform_profile_option profile)
> {
> 	int err, tp, tp_version;
> @@ -2096,6 +2119,17 @@ static int platform_profile_omen_set_ec(enum platform_profile_option profile)
> 			return err;
> 	}
>
> +	/*
> +	 * Enable cTGP only in performance mode and keep Dynamic Boost enabled.
> +	 * dstate 1 means 100%, as on Victus S.
> +	 */
> +	if (has_omen_ctgp_control()) {
> +		err = victus_s_gpu_thermal_profile_set(profile == PLATFORM_PROFILE_PERFORMANCE,
> +						       true, 1);

Why enable Dynamic Boost unconditionally when the firmware would almost
certainly disable it in case of low-power/equivalent modes? Wouldn't it
be better to make PPAB follow the selected platform profile instead?

> +		if (err)
> +			pr_warn("Failed to set GPU cTGP state: %d\n", err);
> +	}
> +
> 	return 0;
> }
>
>
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> -- 
> 2.56.0
>
