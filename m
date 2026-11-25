Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605372;
	b=HE3Hdzs2frI5JBzljfCvgdFRtEDEFEwJ9cNjS4dK0gXsbtCaB4QJrN+GqdpaPLX6mC5C
	 Qz5PY3KDi+vhgFk637ey7oGBTx1C3fhhKrGoesTNbAN2DGy0oeEx1TXPP25HXkjmKBuQ+
	 vrSIehWNI8Jc4ly+O0sQUY1wrMfu/+ojWJE/9Nhp4aAjPW3j2dnxJr+lA8NSos6IB9tFz
	 Lfu3FQtkLbP4fEGZcO0TfOyqHY+go82yFdNCAsmfYjdFGjYiyd11UnsQksoSBw7x4oj9P
	 BuvisCp30W+qF3zlzN16V2/gpOHyKdG+eckObcXZGvUPlz1Dr2dOXWbxfGm87gaSWgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605372;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vx7YNc78s95n9tQ4kGlT5XpPau9zDZptlxnEIpP/bA8=;
	b=bkAzRRz1kQze1JlD3AIeJuyCYc6dRZJOedhVG2zDvqfuIUQT1hWY5JSARxCxfGP13ky+
	 ynB9PGEwIX1vSTcnDGTB1cmEz0H3fFSMFK+b8no6ua5oUR1uz9s7sQpVm5B3RCg+0qTYT
	 XAWDJROTjLiHb+LAr+af3Ua4Oeeez7vrK/knqQrQg3PCtBBbG+YlKbnrtVpUhcjwVtEOu
	 S7FiN1BwCooS4gY0oP3tup7lJFII89psmJOY3YCy75uWKmtXRX5wkHk4PKl5BZufF6AU0
	 gNI29ahW06oVStZj97+Qg/07PwcEguAB7MP5aKDPNgYJ0kqxo43aMy99mz+8hNqgTBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmXQ0rp0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84895606A321;
	Wed, 25 Nov 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmXQ0rp0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44C41F000D4;
	Wed, 25 Nov 2026 11:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605371;
	bh=vx7YNc78s95n9tQ4kGlT5XpPau9zDZptlxnEIpP/bA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NmXQ0rp0GCmYIzoTBH1XYK61oKTsXtVzDFpEKL0QMRGNCRP4BTHt1YnQ7axvFIzpK
	 SJKDwZ0HLTw7PgTA2uuaEutrmu2xqP0i6HxLOQJQ1vAupIHWukj1kz6/uaEpXt/ykp
	 lmITD3IcKEyIwX6gqS7d6quiqTOU0Y4cmymUApZwXVkkJD6Ll7ESqYgYWTSW84oljt
	 bF16GRsy60D7y4mX6QlpEqz12juE8FRbRlMxa+L+7rSKN+ow/1gQ5d5ahPvqPSEI35
	 qEGpvi95lnfJsEp8CrkRxN2y+3qdjhYt96RjAx57fA4VNsnYTdX6DDkxsL30lOX/a/
	 Mlzmh85IddnvQ==
Message-ID: <84ecba76-5fe7-4bb2-b18f-efc7cda2247c@kernel.org>
Date: Wed, 25 Nov 2026 12:16:08 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: int3472: Use actual clock frequency for
 DSM method
To: Sergey Lebedev <lsa.uz@pm.me>, Daniel Scally
 <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>,
 Fernando Rimoli <fernandorimoli11@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125090921.46652-1-lsa.uz@pm.me>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261125090921.46652-1-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Nov-26 10:09, Sergey Lebedev wrote:
> From: Hao Yao <hao.yao@intel.com>
> 
> The third argument (args[2]) to the _DSM method was hardcoded to 1,
> which selects 19.2MHz. A sensor whose SSDB asks for 24MHz therefore
> runs from 19.2MHz, and everything it derives from its clock runs at
> four fifths of the expected rate.
> 
> Pass the frequency from the SSDB instead, with 19.2MHz as the default.
> 1 selects 19.2MHz everywhere, but the value for 24MHz depends on the
> platform. Where the frequency field is one bit wide (Tiger Lake, Jasper
> Lake, Alder Lake, Raptor Lake) it is 0, and 3 would also set the clock's
> enable bit again when the clock is turned off. From Meteor Lake on the
> field is two bits wide and it is 3; 0 and 2 leave the clock unchanged
> there, as measured with an oscilloscope.
> 
> Fixes: e4543de8b6ff ("platform/x86: int3472: Evaluate device's _DSM method to control imaging clock")
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> [Sergey: pick the 24MHz value per platform]
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
> v3, sent by me as offered in the v2 thread, with Hao as the author:
> - The 24MHz value is chosen per platform. On a Surface Pro 9 (Alder
>   Lake) Fernando Rimoli measured that 3 gives 19.2MHz and 0 gives 24MHz
>   [1]. coreboot's camera_clock_ctl.asl has a one-bit frequency field for
>   Tiger Lake, Jasper Lake and Alder Lake (which covers Raptor Lake) and
>   a two-bit one for Meteor Lake, Panther Lake and Nova Lake.
> - The Fixes: tag and the note on 0 and 2 that Ilpo asked for.
> - v2's Reviewed-by and Acked-by tags dropped, since the code changed.
> 
> Tested on a Surface Pro 11 (Lunar Lake), with the module built from
> Ubuntu's 7.0 source, where this file is the same as in media-committers
> next. The VD55G0, whose SSDB asks for 24MHz, streams at 59.14 fps as
> its controls give, against 47.29 fps without the patch. The two 19.2MHz
> sensors are unchanged. The Alder Lake branch has not run as posted.
> 
> v2: https://lore.kernel.org/all/20251208035122.2147678-1-hao.yao@intel.com/
> [1] https://lore.kernel.org/all/20261026111012.33347-1-fernandorimoli11@gmail.com/
> 
> Tool use, per Documentation/process/generated-content.rst (Assisted-by
> tags in commits were dropped in 7.4-rc1):
> 
> * My contributions to this series were prepared with Claude Code
>   (claude-opus-5-5); work by others in it is their own.
> * This replaces any Assisted-by tags in earlier versions.
> 
>  .../x86/intel/int3472/clk_and_regulator.c     | 39 ++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 9e052b164a1..47dc23c5184 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -10,6 +10,9 @@
>  #include <linux/regulator/driver.h>
>  #include <linux/slab.h>
>  
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +
>  /*
>   * 82c0d13a-78c5-4244-9bb1-eb8b539a8d11
>   * This _DSM GUID allows controlling the sensor clk when it is not controlled
> @@ -19,6 +22,40 @@ static const guid_t img_clk_guid =
>  	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
>  		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
>  
> +/*
> + * The third argument to the _DSM method selects the clock frequency. 1 is
> + * 19.2MHz everywhere. 24MHz is 0 where the frequency field is one bit wide
> + * (Tiger Lake, Jasper Lake, Alder Lake, Raptor Lake) and 3 where it is two
> + * bits wide (Meteor Lake and later).
> + */
> +#define INT3472_DSM_CLK_FREQ_19M2	1
> +#define INT3472_DSM_CLK_FREQ_24M	3
> +#define INT3472_DSM_CLK_FREQ_24M_1BIT	0
> +
> +static const struct x86_cpu_id int3472_dsm_clk_freq_1bit_ids[] = {
> +	X86_MATCH_VFM(INTEL_TIGERLAKE_L, NULL),
> +	X86_MATCH_VFM(INTEL_TIGERLAKE, NULL),
> +	X86_MATCH_VFM(INTEL_ATOM_TREMONT_L, NULL),
> +	X86_MATCH_VFM(INTEL_ALDERLAKE, NULL),
> +	X86_MATCH_VFM(INTEL_ALDERLAKE_L, NULL),
> +	X86_MATCH_VFM(INTEL_ATOM_GRACEMONT, NULL),
> +	X86_MATCH_VFM(INTEL_RAPTORLAKE, NULL),
> +	X86_MATCH_VFM(INTEL_RAPTORLAKE_P, NULL),
> +	X86_MATCH_VFM(INTEL_RAPTORLAKE_S, NULL),
> +	{}
> +};
> +
> +static u32 skl_int3472_dsm_clk_freq(struct int3472_clock *clk)
> +{
> +	if (clk->frequency != 24000000)
> +		return INT3472_DSM_CLK_FREQ_19M2;
> +
> +	if (x86_match_cpu(int3472_dsm_clk_freq_1bit_ids))
> +		return INT3472_DSM_CLK_FREQ_24M_1BIT;
> +
> +	return INT3472_DSM_CLK_FREQ_24M;
> +}
> +
>  static void skl_int3472_enable_clk(struct int3472_clock *clk, int enable)
>  {
>  	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
> @@ -35,7 +72,7 @@ static void skl_int3472_enable_clk(struct int3472_clock *clk, int enable)
>  	args[1].integer.type = ACPI_TYPE_INTEGER;
>  	args[1].integer.value = enable;
>  	args[2].integer.type = ACPI_TYPE_INTEGER;
> -	args[2].integer.value = 1;
> +	args[2].integer.value = skl_int3472_dsm_clk_freq(clk);
>  
>  	argv4.type = ACPI_TYPE_PACKAGE;
>  	argv4.package.count = 3;

