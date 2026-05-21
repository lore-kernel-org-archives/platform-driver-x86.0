Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6691223DE9
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372185; cv=none; b=NNn/EivfKyf4jrjLlP21eMej/DuuEkRAjt5JaCtMjOs9/8jOvf2HdHp223FKfRtZvNBgkCSbDH/9Ivf9M3Os6qS7+Ad28IagZAnG733k4gMgLwQahpljlas6X65aNTRzLtu18SXI7gJoPzkrn4fC5YHOLjJxle7NBVzp4ekT7D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372185; c=relaxed/simple;
	bh=skTMXI3RZGI7GmUoVsIdU1joRg58TsKMLk2QbNln6tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMQqXf8aERD90KAk3fHXsPHgwRKWBWVI8UQ/mqYW2ge8ZYqoCHspl/qFqCe3vV3nIU4d2x5dFIM1Y9ljDFikDjMoGUmpGft8T5btvCXsSoPfajyxrQZSZxkoRYu0w4/jQwujRTq+GVCDF2BIshRYFFrLQL0NaE0wSPhsLzyqYq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2lZ5/zF; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2lZ5/zF"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so2545100a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779372183; x=1779976983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UT0o69KboHGcWGrgPHwXh61B3F/dFCqy9/k/6O2D6mg=;
        b=U2lZ5/zFAeqsbVzvXqUyYprRG0F0eZ86wzEYiEG+VSPunUF2Aigaa1BRmnmndWkowf
         TgQwRydpUS6GA0fsaClbFDumita/ys/pgOnnUzoiQzSNhI/V3WLORP9aolxSM51UeRAZ
         gXo+zaNaWIPoDWwq8yj13AYcp1qgbtvWaHC+NMAh3Zwy33HnBGvm2ma+3m0Lw9irICyY
         PSYDz95/XihuEhX+sZ/A4k8HuRL+UMVUGIN76Ah0GQW+inyBO4RVXn/zSv1aP3zzYeE2
         ehKGeRRPsZiV+FStwPVNfKt6Y1N1b1lm0nMXqPGrxeD/Ekk14RUXlPaj9Liuhmb0yWJ5
         w4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372183; x=1779976983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UT0o69KboHGcWGrgPHwXh61B3F/dFCqy9/k/6O2D6mg=;
        b=Z+AXr7vL5cwZHgMCmyf7HNCDGzfwRNgl7I2tvcUDVwXt9lKfcSJ+CR6dYpPChiBg/Z
         eRuwGUpVS5nULKocUkhqLCPIXcjA0yhwK9ls2Z970bDr45vRnhUxByCChEc+YqDaXz6E
         Ms3eHiNVeK5t6yvrzSAo3EA7je9Gqifj4V0fMoEf20e5L3m9PvKIHZWfj+w/7oJr9A2b
         WGE64h5R84epw0TGEwsEtALI7RhOT3tKqK/EZawymuXqA5gkcJB557o/l8OcrLbLw2Zd
         wWdVOztxgCjI683dc84TPRTT9pyOplED8dRA+dsT8h9aCaqZ4jUCmSvCC3Tej67LAmx9
         qzTQ==
X-Gm-Message-State: AOJu0Yw3jLqRHjSquUEBaEMbaDctpC2PAT2w+xxxT1/4ZJ30OqK8cUNc
	MOi8MPQTKIeYUCAzMBY2iEM+iqBQ6ggbPDMOwfqUJbChqyjDbpHqKVih
X-Gm-Gg: Acq92OGBfUJpKNokdRkRo4fyZtrf54Y0QcNBeSIqY30RRFnCQUdwdZ/myQhdSbccE4l
	kWPkyDUbGPdnrt5vchIl5/uNt7PINnDm7Uc+POsLFr5cNvj8BhICSHdGnAGN9050wR9wG8gFqrR
	7OsUh3sIbppafSV6XzVjhwW6hKfZqaYxK8VGJoC0KRV39yCSlLv3kbH4bcxfmzJxOqFBRblaZ7g
	VZ8NBUUHc30J1MBSi7RXaTdMk7DON/OgG5Xexwp2n4wS9fs5MCAuAKLDenX3yVbZdDFFgAMVUyq
	hwz/kP0Ylp+R0adOAk7zCE6JvPglUKoF8VnbrPRaa0s0uzvRlvo91vgNm0vinBHPC6Ah3nrr/Qy
	hgmMJK4TpPyowvw90kQPXEUyRngpzD/R86mQg8+stcI3q/eTeWVdSJD/a9J1AmYsiaW709DSHtI
	2IkVV2qey31ko5lwchlXfk8L2LvM1PEyAxP0QSWQB2brAPOM2g47IOUc8Etd/u+IpKgOnKKNenc
	54AY7a0ZEzZy5vDts2j
X-Received: by 2002:a05:6a20:431a:b0:398:9b42:69f7 with SMTP id adf61e73a8af0-3b308ac59a5mr3577408637.39.1779372182515;
        Thu, 21 May 2026 07:03:02 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:72b8:b88f:97ce:a863])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85198f4fa3sm391735a12.18.2026.05.21.07.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:03:02 -0700 (PDT)
Date: Thu, 21 May 2026 19:32:57 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Radhey Kalra <radheykalra901@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v6 0/4] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan
 control
Message-ID: <ag8O3BkBmHfug9CB@archlinux>
References: <20260521133351.1512718-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260521133351.1512718-1-radheykalra901@gmail.com>

Hi all,

Apologies, I accidentally replied to the v5 cover letter right as v6
was published. Re-posting my feedback here for the correct thread:

On Thu, May 21, 2026 at 07:03:47PM +0530, Radhey Kalra wrote:
>Hi,
>
>This is a split version of the Victus 15-fb0xxx fan-control change.
>Patches 1 and 2 are no-functional-changes-intended refactors which move
>the existing thermal-profile and fan-control decisions into
>board-specific .driver_data. Patch 3 fixes the fan-table GPU delta
>parsing issue found while testing this board. Patch 4 adds fan-control
>support for Victus 15-fb0xxx board 8A3D.
>
>v6 splits the gpu_delta fan-table parsing fix back into its own patch.
>The previous 2-patch v5 folded that behavioral parser fix into the board
>data preparation patch, which was a mistake.
>
>8A3D is kept fan-control-only because the verified behavior is the
>Victus fan-control path. The existing generic platform-profile sysfs path
>on 8A3D accepts writes/readbacks without hp_wmi errors, but CPU/GPU
>power-policy behavior was not meaningfully validated.

You are right. Because your board is not registered in any list, so it
goes to a fallback route and registers quiet/balanced/performance/cool.
Changes to platform profile are handled through this chain:

hp_wmi_platform_profile_set
	-> thermal_profile_set
		-> hp_wmi_perform_query(HPWMI_THERMAL_PROFILE_QUERY)

For my device, when I selected victus_8a3d_board_params quirk, the driver
tried to use this query HPWMI_THERMAL_PROFILE_QUERY which failed and
caused the driver to not load. In you case, it looks like the query does
not return an error. However, not returning an error does not necessarily
imply that it is working correctly, which can be further confirmed when
you mention that changing power modes has no physical effect on the system.

>Adding 8A3D to the Victus S thermal-profile table would move it to a
>different, Victus S-specific platform-profile path that has not been
>verified on this board.

I apologise if this comes off as pestering, but I do feel that Victus-S
path should be tested at least once. I may be wrong, but at least we
would come to know that it is not the right approach.

>Based on platform-drivers-x86/for-next commit:
>165e81354eefd5551358112773f24027aac59d5a
>
>Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS
>F.22. With the series applied, pwm1 and pwm1_enable are exposed and
>the EC-layout warning is not emitted for 8A3D.
>
>Radhey Kalra (4):
>  platform/x86: hp-wmi: Introduce board-specific feature data
>  platform/x86: hp-wmi: Drive fan control from board data
>  platform/x86: hp-wmi: Skip zero GPU RPM rows for fan speed delta
>  platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
>
> drivers/platform/x86/hp/hp-wmi.c | 212 ++++++++++++++++++++++---------
> 1 file changed, 153 insertions(+), 59 deletions(-)
>
>---
>Changes in v6:
>- Split the gpu_delta fan-table parser fix back out into its own patch.
>- Keep 8A3D fan-control-only and document why the Victus S
>  platform-profile path is not enabled for this board.
>
>Changes in v5:
>- Drop the active_thermal_profile_params global and dereference the
>  thermal-profile data through active_board_params.
>- Move the generic fan-only board handling into patch 1, keeping the
>  final 8A3D patch focused on adding the board data and DMI match.
>- Wrap the setup comment added in patch 1 to stay under 80 columns.
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
