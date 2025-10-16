Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A3262A6
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760635406; cv=none; b=U7SFcBrImLAxkXDGuthVBFc//tyMQhgKsE2bU7k4AbPK95ZZn8usMQ38e8SZHQEgG4iaWSyZwIY+4hbyx6h4QcQYCxI4kN55Sl12b84FhI3pcsPLWk4c31WXAgO4v555mwvps7nSJ+7hrupHQso6CsxIgSVg0bvkehbxZV8yZQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760635406; c=relaxed/simple;
	bh=hqCkyIa8Ndsof8l2/5nc/dxBgDQ/Lwmq2f9+SsjQxG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TMRwm97gCNpnCP208fOpBl+4/H3fpMGp6HszbjgPUX7e/FspzgLdIYCXtu5XBj5lt4wOHKvKQ1IOEZMsjH6ZfrGTRrnfVmU07uIgfdPGZwwWuMg1J3hzFEHujVkCIrz1MvcE6OBVODbpLNd5q8qneDlvaBvzbNQ6ZfnlqKGnM8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0uoxcHS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0uoxcHS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33b9df47d7dso1437813a91.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 10:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760635404; x=1761240204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pEzS7xov2bHNWnYhM2kGJUlTre7AVr9zGXjCQj5iIk=;
        b=Y0uoxcHSv5eXE7nApcz58Qvq6l4xVKShjQRz54CGoEKeIiN573tnE2fOx0YYrO3Lda
         mPfxcTA7gJBiCIePO+nZCpIsq1pHf1MiyJApeDMKgqZUCk6chC/Ph2JibTCtav/6lua/
         CMopJ7mcr4sQiSeBJAx+h2RPMkqa5g5qhepiA+mOP5Ee2xXh4jU6B7mwLQHDHzlFAARh
         UJlgmmrIwC4fJ1xfwNAm1+f8M5+yWxsgAFsYDg/sS9dozqapYxS8yayhao+5IrM/BZeB
         H3OSoQa/jzsTQDVwKpUMaYvM1M2tshqIJP9T4iZE0l/WoMT0oYyDcuadF8MVwK3NCcbg
         78ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635404; x=1761240204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pEzS7xov2bHNWnYhM2kGJUlTre7AVr9zGXjCQj5iIk=;
        b=UtW2rW8cCCjCpgzUVxqZ5DQanG0Z45FmG0ostnWcqvFTk+4HA+/lVS+6hH4hfEKJV0
         jfz00Gv9VzUfg9d1klZ4fF+wQWbrDPD9ILEy9s3qGwZbh2Mwo2PQuEzcUu0cbF9U9LPK
         DvN0ai/ttKdfx1fsnHONT47B5ihqiDbM/T6Q6X1BmEcs95x1n/IVhlGoy3Wf8ipZZaAn
         PFLMR0D/6XGGVEp2V2aXa+Fup3CQpXThCUEsBSvutV3QmWt/N1x585Q7UOymHFB18r3T
         0RJmxWfENUjLd2tBRydAfOl9v/p6J0p4vTGRedp43ARqDMk6D3IDf3Hw9a60UAXrftmD
         gNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzzb9yGo+AF/EwGpaACJTjaVhI35KD9Mh85YIEibGtJBLm5xwv/h/kOEwHTcKY2W09O7ih/qWXvL5wdPf9quzWN6gM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Ax1Rz4GJVjdzfRddPpKXXFYaN9/5Q55FDAu9HAppZuGYFLnk
	E6ARyjMNBle5sHvVN30g9rz6M8ieYRhf1pyQIOGNYHqNlTXPz50XtbhN
X-Gm-Gg: ASbGnct7Dt5hs4o+Aq4KKySTT46BsH7Xb7Hc0BlrnNe//LI3nOLJQNa3d1ZPzmulEep
	BuWtU5fkUSV7G6RqwBYVfxn2fBgxR20Y7vpYmCCMxHCEfda6hztInoC/a/mYNetVTY2a4Qioprs
	xOG05n+Nk4Z5wgIvEkRgyrExTEx9b9ni4JMs6+NVWEsOLmZU8blDWbpdpS7+OfLU0zkPQlJBYv3
	WtRVWPPbVWhhnmHDNKe+hHUWiAi0iSbo/ZxdsKF4OfM1N468RbgWBdE362e25vVsf6tebdvOtkw
	alQGwkKUJQT4h8xLTLHlepKtn7riSVR9RJRiBg4YLGdMwAopK463nKfH/ExJdbINeu7Ue1uccQO
	Shiuj14g1fjFnhepq++Lh6lrMzdlOm4ixGrHaxdbXqDPyoUgj5b5ljABeuoi3V4CjXdhMJl3z/o
	0odW/uMRf/y/P17emQLJe3+1vxEKiv
X-Google-Smtp-Source: AGHT+IHShMrQ5kJEQ9OH1QFWe+vtUUyhQBVUXDSi3QgLq8tBOpNymms3o5Fo6o9wjoKZQ+vlza5VZw==
X-Received: by 2002:a17:90b:4d12:b0:33b:cfaa:d01a with SMTP id 98e67ed59e1d1-33bcfaad01dmr461500a91.25.1760635404088;
        Thu, 16 Oct 2025 10:23:24 -0700 (PDT)
Received: from cacher.localnet ([111.94.119.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb663285dsm2588728a91.17.2025.10.16.10.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 10:23:23 -0700 (PDT)
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: jlee@suse.com, basak.sb2006@gmail.com, rayanmargham4@gmail.com,
 Armin Wolf <W_Armin@gmx.de>
Cc: kuurtb@gmail.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] platform/x86: acer-wmi: Add fan control support
Date: Fri, 17 Oct 2025 00:23:19 +0700
Message-ID: <5048620.31r3eYUQgx@cacher>
In-Reply-To: <20251015192551.321200-1-W_Armin@gmx.de>
References: <20251015192551.321200-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, October 16, 2025 2:25=E2=80=AFAM Armin Wolf wrote:
> This patch series aims to add fan control support to the acer-wmi
> driver. The patches are compile-tested only and need to be tested
> on real hardware to verify that they actually work.
>=20
> I CCed three users who requested support for this feature. I would be
> very happy if one of you could test those patches and report back.
>=20
> Changes since v2:
> - get rid of nested bit masks
>=20
> Changes since v1:
> - remove unnecessary blank line
>=20
> Changes since RFC v2:
> - improve error handling when setting fan behavior
> - Add Reviewed-by tags
> - whitelist PHN16-72
>=20
> Changes since RFC v1:
> - remove duplicate include and replace hwmon_pwm_mode with
>   hwmon_pwm_enable in second patch
>=20
> Armin Wolf (4):
>   platform/x86: acer-wmi: Fix setting of fan behavior
>   platform/x86: acer-wmi: Add fan control support
>   platform/x86: acer-wmi: Enable fan control for PH16-72 and PT14-51
>   platform/x86: acer-wmi: Add support for PHN16-72
>=20
>  drivers/platform/x86/acer-wmi.c | 292 +++++++++++++++++++++++++++++---
>  1 file changed, 269 insertions(+), 23 deletions(-)
Hello,

I've tested the patch on my PHN16-72, this time the fan control for CPU fan=
=20
works just fine, but GPU fan control doesn't work anymore. no logs observed=
 on=20
dmesg while changing the speed of either fan.

Thanks,
=46a-Iz Faadhillah Ibrahim=20



