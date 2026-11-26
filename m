Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706701;
	b=evLdeeLY3yhueVbwrfXWbxZRonDheHsIcW+wmSzhLtyQT3K7A0tRgzaztI+7ELTQvHlV
	 zR+yoxeDjVfJSQu3NRTlwCSuC7rGCwIonHVdiMPj9em7nHuyoyvWmxPkDs8sSZFUVgPyt
	 y0zlO1tphs+bPCEqzcbYcrT29dX/hiHPX6Ajdg6yM50EYJjcVJffGvP3qsBYZcCQ2VS6X
	 YmvaSkR9KgYaRkWAnSnLLuDk6X4q+yH4d2nib/IJnzyykJ0HOQWjaHZLZXp3SSfCi/RGv
	 9X3YRVWNRekn0LPSOVVeoP0/Vq6j2lpizezWg37dPj1CaC8g2Ipl5cOrCvp/YRCYJhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xn/JakdLtzzNaeEXa2XMzMriecmeUnUrG6zt81Wp6lI=;
	b=42xxZoarhA/xOhcxMSucdCgYILVfu3ANJJswMyDuDStT2/hoCaPWk1mj+E4Moa+fyZ52
	 1vJuRYytPP2oJ0GcvBcSaWXNkElLWxvIvk6Xap5AE9l08/bP2wDpuPdzr1i6nlXItCbDj
	 9V0CCIhMIzKkNraIjL98sy84u97B0ZqcmWT2t0g7DSm+sRIs69ucLc/TevZu/YHwSw0UB
	 LKqafjumbICeo43gBdB0JXn6grJO7fjMOmCuEg2zQrcGBM6zkF3dXx0LllAEMxzZvq95h
	 AFIm1S1uLyCAQQq27ksvhMxnm72Xr0wavjHaQ8P0nTWBcgb10KDtiO9ZuFlTG8rL5+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mn992LY8;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5929B606A327
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 15:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5929B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mn992LY8
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f05bc71e01so30462805ad.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 07:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706701; x=1796311501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xn/JakdLtzzNaeEXa2XMzMriecmeUnUrG6zt81Wp6lI=;
        b=Mn992LY8voVClIyMUG0WWQbZNfWulJ61mjwP5Cku6NprsywIVg5eouVIzAKYkCG5H8
         4NRgM4NC/AEmumt+C+WnTdxfw7ZlqWHyPJZxBHhbzjKjwuFrcZhMyncZbet4cgmX5HSc
         7EBRPqslrcFgEhF4gAI1FKwTcxc/eQiTSk9tM26SP25KFlki8MGjUc8f0PlOLiYI/Z4B
         hfXT5LyGs1Ud7GANF8lQO55yADDh+oQFhBIu1PZluKm9gHNiULRyI3pW9ZeUIXz5nRxW
         +tmf4Icf0r2nDWYsIYUHfiaqFNsjmSOMmPW6YyJcfb698r6LQFLzmcrU2tLRVD/rujZq
         RTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706701; x=1796311501;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn/JakdLtzzNaeEXa2XMzMriecmeUnUrG6zt81Wp6lI=;
        b=G9sXg/kN6tG1GTb3Kn3eYeveX1LY8KUGmTYhJC0h1YmoIC4H71nWb3R+NTX/sjzzqQ
         /IeDw3RLn/l+844P/H5F55LjHVWyg6vq8Os4uwZr0vw2EsQUgEuB/nu5hdENy3ZSzFH6
         /cbACVFQ6hha/vAQXq18pmrJrtOBspfkCmyRw21wENAvabKRckRiiFmBxOqUKQ6yB5Bm
         MdXGH3Yi809IIyrboQM7tsQEDQzyehQKKw2VSWGsACxI3P5dF5kwz3O0rnTZducRpHsh
         g6dT7NNhnEoLjbNie0oar8ZTSwdmQPUnCZduCqAOYVn5N2K3cep7xpnvWeEh+UWyzk22
         5jvg==
X-Forwarded-Encrypted: i=1; AL+hErHlmk16s9BlW2y8aTPl9dz+K07vW58JTzNPCkjA/6NUIQX2bywAm04L3pCiuyRDIDREdV9fyBP/W0z7E/90xhl0/zz8@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZClrCd8F6Ln+8BaHOz6iR/SqLmr6fLM8wCQFTWew5Kl9tOne8
	REH/26EAwdyY7Aryhpu12ZFjnPEK+6g0EEoOZyXtjsB7Emqrokdy4PGq
X-Gm-Gg: AZFdTZeMNJwie/679d03vODlcMDqggnzd7BrLoDMpfBnM+Kwsxi/pEtIBU8mfS3/f3k
	a0mtA3VqRmiyMUKgsOEhGXoDyIddhPxihh5IxI7Ny/R7cop6ihcDU5GYfnfwfM1DN33nME31nmv
	+H8FLoOIFJRpvNF9NH1+0u6Woi7ORFtclHsHXqXQMQQajQsBpR5f4PxZ26lofsquoIfP3UxWFj7
	vObRXO7YvwXX/t9ftSF0ES1buzgZDZi2Zzow5Sdcga9+aJaUBdNexB/4hgRH/DUBcuSv5Z1gwN1
	iTV1KxbFtSuxRMEYuAGAqlq4fpHCfO3S4XwpkxvbNhvQIehzB3qI4ryGT25cwgDNhHs/TozpAOj
	Wk6OTnHc4Ix0uk7187m5aJcFHFYx3bziEqXU60grPM+CHMTghrDjJTRMi98IuBMRj2qBQqAe2ch
	i8rM6PzwPkTdnF0qhQVdyGulOViiv4ykO+j28oBCQ16uVtqOpRPk5+9hP422GMaLGYC14ONqkLH
	Hy7tbRcWHXkIKpSu7ItutVB82O09FDCFoF6BTF1jaiyMYyjScGMBDNF1MnHfwd/MmPxARG3g8HG
	b6UgPJZKlUeLsgQvHvBFdhv6hr1OfemC309fhHCXLkJFmE+9FNIU+YYYKwocgwuf4bXn3Lm9xy6
	Q2k0Oaavi3Z8Mk1suVci2gFXSrNWmsUzN7yeSlDvD215FmI84lLfxTjIC3z7/62e1BLJ/0uTTt2
	495zmddzAiC+GY44+OnMYvgw==
X-Received: by 2002:a17:903:298d:b0:2e9:740c:36c with SMTP id d9443c01a7336-2f03f1ba67amr211995255ad.41.1795706700672;
        Thu, 26 Nov 2026 07:25:00 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04ed9620esm98281065ad.26.2026.11.26.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:25:00 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Punnay Sharma <punnaysharma805@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: don't warn about keyboard backlight type 0
Date: Thu, 26 Nov 2026 20:54:48 +0530
Message-ID: <20261126152448.847538-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <3e932924940536878264c1ab46d24bd6db362183.camel@rong.moe>
References: <20261126073107.765676-1-kapoorarnav43@gmail.com> <3e932924940536878264c1ab46d24bd6db362183.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 26, 2026 at 08:15:50PM +0800, Rong Zhang wrote:
> See https://msgid.link/20261107140700.16036-1-punnaysharma805@gmail.com

Thanks for the pointer, Rong. Punnay's patch fixes the same warning and
was posted first. I missed it because I only checked pdx86 for-next,
where it hasn't landed yet, and didn't search the list archive before
sending. Sorry for the noise.

Hans, Ilpo: please drop this one in favour of Punnay's patch. I'll test
it on the V14 G2 ITL and reply on that thread.

Thanks,
Arnav
