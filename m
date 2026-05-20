Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40743C4576
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 17:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779299436; cv=none; b=LQhrT0y13/+aIIdHa2omOFqGClqKQaGdrMjd7nVAcRk3BhI1hH3mly1IoRwnaPKGBGWirZcs3NFNzwmTltqxmEi8tUWGGUrTk8F3VCNz48MJ70F8WJ1mAX/1F9B9ICcN1rcQpuU3Y1l30E87/+hLEyxRClCJeC1IsJiCuyhnzxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779299436; c=relaxed/simple;
	bh=kvKUKu63wXRArMe4SWmnVCflQNx2c+TFVRK2zj7bV8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzH2+lLbkNX7HFg0i90+uT18oXZy27bbvEH8PQUxrKPPg/dLK1oKlxFElLj0oQg/He/mjBc4YDAFi9E1rUfCpP25w+CfyaVCxmiaITfF8m4icvvCa4CD8xPiPKEFpc3u911ZhjR9ZlP1Bg3+4pUE5D+WZePJIca6mWUfeuUxQUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AT/XfMCp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT/XfMCp"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c8095d7d75bso2056396a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779299434; x=1779904234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+98kNa38ScxujiEPRy4OCNB/a6vd4/r6h2apaEzAbQ=;
        b=AT/XfMCpST7eG/xDCrakJw6oY0y2nXoUmVGWutTRwSk9UvthsS9AcoVnXuLnqJJLZc
         gFzjCH+Vps1SbAx7NEB4+tpUDOGukodVSrWVXSjgKOs+mKhe5+NXLSQ8a1MqcnToxFzR
         2bgsEtN+tHK4/oC42PtACsMRkVP38RaXmX67ikPAws45h4OqoA/tZKoHH6BLXAPNfq8I
         +K9SnKlHRA0SsHgzv4NEuf3PEuOeTINLxGynAzZqJtCm1cwxpSeJD4YaOTH5D8YBn26/
         v8ZeqmASYBZKsYi+bbGz9Xw2QkNEHuCGop5JFL+Pi7iQTX92f11Ffk/CMltZQ/0Zargk
         nVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779299434; x=1779904234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+98kNa38ScxujiEPRy4OCNB/a6vd4/r6h2apaEzAbQ=;
        b=s3Gj7uCJv2HQeQRPeAhWHIgMGsi7sqLWbhOhNmqtZTOMqotUCFyJkWvdmwoL7Bzuju
         ryE3OFcSdFFLqjweDo0kEJPwQ+TeW4yfpMz9Ix14x8l+Pq0SqOeO33ZbygkQ/xcrWmde
         Jyd9rjnhsFVrVKmXU2+t6lzAAc7/XZ9mUVxwmy2LCzUmGqWp4lG+/9Zq1pqG3usXWUvT
         P0kO3GKv2Pt97jnUujgRXas6OMocwpMOnAd/C0LoOUTzcvkxdkU2QEnqBZR2Qp94e/Bo
         FrQIaiu1T5D/X2/6/zgm46zxNDM+ZxH4wTnPXpMnJ/PYI4HoaWum0juXRZNMf4tA01WH
         naCQ==
X-Gm-Message-State: AOJu0YzdGGM5UwMXSPaoSWjqrM2+ZX98omqqGodLscuIE+R3mPYOR7yS
	r/QRpbOlGBcpgVS2Hsk646LBKVhHz4yNrdyHFLu3A+HvzIAx2gdHHX2t
X-Gm-Gg: Acq92OGXQ0M5f1hzBbE0KgNdIOeJPNjIDZtQCgjFdJnjt3vTPqiZDBKqXoSDEZzz1L3
	7ZFHIeoCRXZcEtImfpRbj//CB2XRSAshnoSgavVZI6rABiVrOqkkBqAjZLqKBY8T9nkJnQmajGE
	wACc6Ytj85gbsGRBN4vgA8qBhePTWwSf20kCJErP1Ny609jmPGmC7irPdQr9tmdzsyFPHJ+rCfb
	ECNn+twVhEYr41Ez87jkOVO+gwoaHJ/SLkSyiqLgu4u+TLShcyitb7cUKzUUugE4K6L44YIHL1i
	cCd65ySqrDh1RmeL+uDD0mxgcqoYUMpYrvSdCZL1q6n50UwXQMVT0yWqKNdfMSjRL8MV8OyzH1o
	1dXQhjbY/4G2nfSmlPy1RDe/3sipLkpXIPPNWvsql5FdvpIz6XJxlktrTB9KqhDzzjzO0kQwHuq
	CPpsem6qHZypQORciN8BpTY2u85UH+1q2Q/XLeYZw7dgftAB0EJ63BIHlnXo1vPezoeiEBfL9t6
	ze6kjoZMOdXW9FUUZIA
X-Received: by 2002:a17:90a:602:b0:369:96e8:c8ae with SMTP id 98e67ed59e1d1-36996e8d08dmr11571758a91.19.1779299433931;
        Wed, 20 May 2026 10:50:33 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:72b8:b88f:97ce:a863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36959b06290sm10483763a91.2.2026.05.20.10.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:50:33 -0700 (PDT)
Date: Wed, 20 May 2026 23:20:29 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Radhey Kalra <radheykalra901@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com
Subject: Re: [PATCH v5 0/2] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan
 control
Message-ID: <ag3yZmFDRUqsoVAm@archlinux>
References: <20260520140800.130530-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260520140800.130530-1-radheykalra901@gmail.com>

On Wed, May 20, 2026 at 07:37:46PM +0530, Radhey Kalra wrote:
>Hi,
>
>This is a smaller v5 split for the Victus 15-fb0xxx fan-control change.
>Patch 1 prepares the hp-wmi board data and hwmon fan-control selection
>so fan support can be described independently from Victus S thermal
>profiles. Patch 2 adds fan-control support for Victus 15-fb0xxx board
>8A3D.
>

I am sure I must be missing something but I don't see why this isn't
just a DMI table addition?

I understand that you want to refactor the structs to decouple fan control
from platform profile so that you can just use fan control feature and
ignore platform profile, but I don't understand why that is done?

If I use victus_8a3d_board_params quirk on my device (8C78), it effectively
removes platform profile support, why is this choice made?

>Based on platform-drivers-x86/for-next commit:
>165e81354eefd5551358112773f24027aac59d5a
>
>Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS
>F.22. With the series applied, pwm1 and pwm1_enable are exposed and
>the EC-layout warning is not emitted for 8A3D.
>
>Radhey Kalra (2):
>  platform/x86: hp-wmi: Prepare Victus fan control board data
>  platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
>
> drivers/platform/x86/hp/hp-wmi.c | 212 ++++++++++++++++++++++---------
> 1 file changed, 153 insertions(+), 59 deletions(-)
>
>---
>Changes in v5:
>- Reduce the series to two patches: one preparatory board-data/hwmon
>  patch and one focused 8A3D enablement patch.
>- Drop the active_thermal_profile_params global and dereference the
>  thermal-profile data through active_board_params.
>- Wrap the setup comment added in the preparatory patch to stay under
>  80 columns.
>
>Changes in v4:
>- Split v3 into two no-functional-changes-intended refactors, one
>  fan-table parsing fix, and one 8A3D support patch.
>- Rebase on platform-drivers-x86/for-next commit 165e81354eefd555.
>- Move revision notes to the cover letter.
>
>Changes in v3:
>- Rebase on platform-drivers-x86/for-next commit 165e81354eefd555.
>- Keep the v2 board-data approach and 8A3D fan-control-only handling.
>
>Changes in v2:
>- Use real name in Signed-off-by.
>- Replace the ad-hoc fan-control DMI table with board data in
>  .driver_data.
>- Keep 8A3D fan-control-only instead of enabling Victus S thermal
>  profiles.
>- Use the fixed fan-table parser path and derive gpu_delta from the
>  first non-zero GPU row.
>
>-- 
>2.54.0
