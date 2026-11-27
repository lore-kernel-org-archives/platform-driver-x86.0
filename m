Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746268;
	b=m2A7LdmvYIt+a6wtbBdB8h9bgTVnnKmT1z18Akgk28UxbbgZACaM/2DU1sxQI8YUWzMG
	 NGb4ahWKgEyU03PtZzjQ7uTmpnTxGpdVhgpKMhaYeiI15c70WGWnrMX42nVpUPoY+puWk
	 MztCf5BkOPneOCzmOqMbhzi+d96Xs24yDDxvH0QwKp4OA1QpRAnj+mxmBCdPzxZxtSUXV
	 IGgnmYgSbnRlt42y5EGfvcMjnmg7XK7v6oyjOdxG+S6dTxv/UvT+MpKxSk9tdop6CWHuR
	 qDkyORRvJ23ifTE+cfw2E1KIDDneGYUOBvS8EvEewFjLCR1z5Pa+sUAiwPJ4uAmfx1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746268;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9Pj+rgH0SFfagaekBhT1Ylt9JHHzTYBZguiWaQ+YrK4=;
	b=cVoT1FHRsHZA8ZLKCb3vApuHgUL/JiRO4HguLOFc5oAXtsKuyab+MRZZ+J7Wp748rZ5s
	 YJRawLMcqewbkB8UQT+MVX4nV5M7HxHRmbA82EG7pDYm40jl57yviJauK52ZwnZr6PJ1w
	 TJJfRc9zaADuB/pjI0HYCU9m02sr6qlYGjAOUAJcEDOLt5R98ZgtfO5wYRMOEV4+K3l3g
	 lcZvlt4KsWYPkoJrYrFWH1+SldR3VnMIZNv0/oSJdeCu58WGb1pEiKoPE6ewSPesZD7Jv
	 ZBM9aXktjlD2kL84tjyJZtA2dXuJBrvql+KEK3DELixsZKM+JJATN4OzAPEpS59V2/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CPHM0pXy;
	arc=none smtp.remote-ip=91.218.175.170
Received: from mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35798606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 02:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35798606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CPHM0pXy
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WiLvzr5y5MgyNZzGXOtZxkxKygHCxCkqgfrX6CUoptw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795746265; v=1; x=1796351065;
 b=CPHM0pXyLrYKh5saCGlnsx5mjVOURfXKxPWBo+ncajpUyrFdh+5DJbK/d/iEhHB0YhrOX3xL
 rd/7XMlCP7HGryCFwPEYaxUi9mLZVS9WmAjIF+A6mPR0UDecLtqn3OfyQIoVbJijGalLRIej3CG
 5iHpldNcF1nwKv6Olc6V5vvE=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 750dd8ef9f9ca9df;
	Fri, 27 Nov 2026 02:24:25 +0000
X-Mizu-Trace-ID: 750dd8ef9f9ca9df
X-Migadu-Flow: FLOW_OUT
Message-ID: <9d749653-e1f7-4290-a043-c7458c888c9f@linux.dev>
Date: Fri, 27 Nov 2026 03:24:24 +0100
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
Subject: Re: [PATCH v2] MAINTAINERS: Add Ahmed Yaseen as co-maintainer for
 ASUS notebooks
To: Ahmed Yaseen <yaseen@ghoul.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: "Luke D. Jones" <luke@ljones.dev>,
 Corentin Chary <corentin.chary@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261126-asus-armoury-maintainer-v2-1-2091821519e7@ghoul.dev>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261126-asus-armoury-maintainer-v2-1-2091821519e7@ghoul.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/25/26 20:53, Ahmed Yaseen wrote:
> Add myself as maintainer for "ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS
> DRIVERS" as privately discussed with Denis Benato.

Hi all,

I have no idea if Reviewed-by is appropriate here.

Anyway the gist is he's tha one that has worked on
this driver the most (especially with fans), so: yes,
thank you!

> Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
> ---
> Changes in v2:
> - Use "Ahmed Yaseen", matching my previous submissions
> - Link to v1: https://patch.msgid.link/20261125-asus-armoury-maintainer-v1-1-053e67858be4@ghoul.dev
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba7650cb86b0..c47b29d15d15 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4223,6 +4223,7 @@ ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>  M:	Corentin Chary <corentin.chary@gmail.com>
>  M:	Luke D. Jones <luke@ljones.dev>
>  M:	Denis Benato <denis.benato@linux.dev>
> +M:	Ahmed Yaseen <yaseen@ghoul.dev>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  W:	https://asus-linux.org/
>
> ---
> base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
> change-id: 20261125-asus-armoury-maintainer-59689b2f2db2
>
> Best regards,
> --  
> Ahmed Yaseen <yaseen@ghoul.dev>
>
>
