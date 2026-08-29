Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015DF2236E8
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788008776; cv=none; b=rNWfPXON3VXhQBVR7CPwa1Ho/4rrCgi544DF1EzlFSYrKYdI3+9CPnSZQrJpFZh2Y9uOhTT5IjiidmE5BqUlTb/vDzrDTM2Jx2qg2smPd5bPYOYygqbYlJxj0tRgP9qDOAhq8COnucTNyxTk2ZQ0nHvkTuIFlnInUFA5pVxJlsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788008776; c=relaxed/simple;
	bh=QyePVgSgntKbPOF5HNZ7ZVtA1SOpKXV9ugVrJN2nBIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LB/7kcc6vSMYX6FaHmZjFa+hb4hpsaUMPR3Xh19oDvnoKCAMD9Kd9HcDaevDaiNMo0L/BjdPNzYphpxWiYCVSyi+OEBJ7Gp62/LUVLIeahDY21yLux/ir6XShMTMZb3xCGvN20hiP7+6otqNlG/1GqZHccx0INPVq8FyibCu3WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAr5pcLK; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAr5pcLK"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2020314a91.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788008774; x=1788613574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bxUY1SL27+UsLjI3ipAM6u1C7f8w0P8IFMgoZ49BAgw=;
        b=LAr5pcLKc41iVck5TdL1BWgV0EaJ2NxNlv79FD48YwkcVXzHhUHPD+iVNz5w2ncdxL
         GEo4Nihpltp60kWrnsjVz4oNc6M/cWT3LfIsa3Xigny1IzAHe9ImydPipw8lVx4Kb6ok
         HjT8gU5ezAwMbRNrfvCDHlCBxnGWsLUD2gPfAkK2kHdF6IqoL4G8PSfshJBe+4tzRoFd
         PkXe2EbPXyA0wScBTlKcryLK1YL/Rb8ze0huiSqIXGi1SasT9RwMMVYinEcHIe+zc/J5
         lXSftovsFathBhlLHHKdPUw9PuXl3tvdgPEeyEfvEX9Agicl6c171uzT/pa6IKOMK+AU
         Rx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788008774; x=1788613574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxUY1SL27+UsLjI3ipAM6u1C7f8w0P8IFMgoZ49BAgw=;
        b=FWlB3yjpw06ToMfg1fyh8qdfSkbIiWCY9ES5TxL2WiTwr1vTbtUMZZ3dXTcx/MmtDF
         RBzwtEZYlft4ckzE+kDVWuocryLOLiML0zp8BsWDYcZSsFmzciP7b1aJhm03kCkVDKXJ
         MPjvwv3cOXkx9EnGNSG5OiRFXgAE4sjAylhgFPmg9E+bvL9pPB+UyLutHWBEjjJO5TOV
         J7b//RWVBjNAZy3qcsnZNrjDMMltCT0Lsqjx1T013KXjQiBGhUmeB4QtT4EqlDQAkku9
         kk6Fgo5DjIqBFQBrdh80kmyyBzssPWJv+s951KVQHlJnSU6/v31R1y8sSTGHTPAIzhkR
         954Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuB1NEaotrcRGs6YHDC2xthRJ75IuyxN97t5jk3FaBOgC4kCPhkTTP3PW/M1kPp+Ck15SPtD4e5/asLHbbCY4csfuY@vger.kernel.org
X-Gm-Message-State: AFuF++mcRpoThvoy36cH85eWELcGx31ghjdcXIkOpRwx1jsquqdl6Y+W
	aqxvZcE/rlMAA8uWIblgwDxn4ZPFs0dBBRVT2HcUUru7ZBQDFo5C3dzp
X-Gm-Gg: AYBFou1twT44+wNxG4cXOPDUNcL56taaz71ffAlb3aDZrz9mDK2NiqtnHX85t6+lr8C
	ekob1In979ub05KGJvzWImbpwTN7MZO7d1DjMUSjnx1r621rzPfJHPNilUDqJ0jF884l0Mfqcsh
	1WH8LWr/9u8rLhz4hQPvyXzErluJoktNHjbN1+7/dFChsA0i1UeRt/5gSAoz+xL1rFzkYj2TlyI
	bIBorWvWh7vzuoMAV/OqaGR/Y8OPbR0p9pAxNj6rxgNtw0g4+z4VmdJciatCJgsSM86cq+Hkuj4
	LSuZN8DerSHj19wyQSDdBtdSTNFzpfoKLuwd3cRdb7NAQf3tCzZM9e0L4qI5ImmXOxNVC0/Hvab
	c5/x86KByVH0R8Q1E5rM5TyL8xMX3IJc2Eq5azUGnM3h8wt2C1KMqg/C9v9VSIpJuI3jC4Mz/xk
	op95AFcu9ThunSP4Y459z+AdQvOXXKM1tbv2PlFH4kh+IS2iorEZPGQPjIyBVfRLc14XoKP51O9
	wrVnF3ZHt9/Fup8VpX6DCP4FJN0bg==
X-Received: by 2002:a17:90b:2f0f:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-396d0d92d15mr25514114a91.3.1788008773691;
        Sat, 29 Aug 2026 06:06:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:54de:b26f:8c97:cc89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm16489606eec.13.2026.08.29.06.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 06:06:12 -0700 (PDT)
Date: Sat, 29 Aug 2026 06:06:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] platform/x86: x86-android-tablets: Add Yoga Book
 audio GPIOs
Message-ID: <apLZF6b3F39z6bUc@google.com>
References: <cover.platform-v2.1787872237.git.mauriziocasciano7@gmail.com>
 <ed99294bd4ac7cd40fa0b2053795aa24b27a632b.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed99294bd4ac7cd40fa0b2053795aa24b27a632b.1787872237.git.mauriziocasciano7@gmail.com>

Hi Maurizio,

On Fri, Aug 28, 2026 at 01:17:00AM +0200, Maurizio Casciano wrote:
> The Yoga Book YB1-X91F/L uses two GPIOs provided by the RT5677 codec
> itself. GPIO2 enables the second speaker amplifier and GPIO4 enables the
> headphone path, but ACPI does not map either signal.
> 
> Add lookup entries for the codec device so the Yoga Book ASoC machine
> driver can request both controls by function name. Register and remove
> the table with the tablet description lifetime.
> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: LLM sparse
> ---
>  drivers/platform/x86/x86-android-tablets/lenovo.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> index 88693b9a1b01..8a69194a724e 100644
> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> @@ -345,6 +345,16 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
>  	},
>  };
>  
> +static struct gpiod_lookup_table lenovo_yb1_x91_rt5677_gpios = {
> +	.dev_id = "i2c-10EC5677:00",
> +	.table = {
> +		/* GPIO2 drives the second speaker amp; GPIO4 drives headphones. */
> +		GPIO_LOOKUP("rt5677", 2, "speaker-enable2", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP("rt5677", 4, "headphone-enable", GPIO_ACTIVE_HIGH),
> +		{ }
> +	},
> +};
> +

It would be better if we used software nodes here instead of lookup
tables.

Thanks.

-- 
Dmitry
