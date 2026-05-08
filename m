Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B73E92B1
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778250639; cv=none; b=hoPS0EjTwHq80h1PeCQBGgd1LUikh6wjNwFzRX3LqvWuMRaob7XzLR9aCGaTLRujPt03+6JRvtZPp079UQf1uyKLk/YFN0LpxdOWQLqrYxzBTT833MWRtL1QCo1qoMS4DCuFpjNgX8PaRmQ5/CTBAIfVxVx2YmSTp7EkHx8s02s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778250639; c=relaxed/simple;
	bh=dA3ssTeMPL2h0yAgyQCV/GL+K8IFVy37Jn+FniNYOcE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=TodQtVxbv7Ppuzaz8WbZaEbyyGVYTFFITGJ87jheqtOdPhGKgc6T37lWmxPaMP6U5EYhtO0XFRZulgKwY+SG6snUjQM+t//L3VAxcnkQUryWholdxAAoSl8MLkB8K9PRbIl9Ok5+FPKEV7L+LcO/7ahPGGNNZPaka/B/Es84+Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHP7CqVi; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHP7CqVi"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ee990e8597so3603571eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 May 2026 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778250637; x=1778855437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dA3ssTeMPL2h0yAgyQCV/GL+K8IFVy37Jn+FniNYOcE=;
        b=DHP7CqVip+ty72wN1zgLyhdOeh9HyW7nG0h60pQ3LCGBWzZ5a+p2IvqN8ytgx2HRxu
         VzT9eRRzjAmYF2EtpH0C737+CUlKxLUuxxEqY5fCx34M2/EwHKGo/fUvPJ3a/1USkDFd
         d2kJWSdgdzXsG1TSz6HOIO94+VuCYIOUGdObI53pQzde5eMvpKq11NX491YMY9EA3ezH
         PbPEsIsGhPmUY5SG3MNZWTPDG++kIh5JC18XO3k19LK4hDIpWAnd99ZKO+et47uy7Adc
         Ro1+03S4lofZxa1pELPstjKSfTkXt6I3Btd+mrDwUnhZXTehGv2IJGMnXKi5qxx3tRSz
         h8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778250637; x=1778855437;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dA3ssTeMPL2h0yAgyQCV/GL+K8IFVy37Jn+FniNYOcE=;
        b=R+MV6NBrSXoKaCty5jz55+T4hLBD/ZHhdreKYYpw/f5ExrovvKB6vLBkBqsz1Zsmxb
         Rvf2o9VCSz+AOgNG4CmAgOg9s37CvB8BiARq7l7nC95580jaGwfZ8P6ZqbT7ph46O/vW
         x/qBWg5CoC4BcbK7Ec9fkqJN+w48ppw3E7JHudRRaUzHake7w1xBMLYUf3WgbQaYHJCS
         Q2CCPcr+tBfeOPn7PiEnRJ/3Z0bRbrddmwNHf6NF7uNWC74nEKtrH26/VV/pasZG3aGD
         Bkg/6uh1F8r08VyUdi5ygkHldLWIVcupj2wkKSXbyhRUQnvfdVNo3aIfqJsrAhGaWM6n
         EOoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9leH2IVDAC4x3LzbzaARx6jkAMYLUNy5r8jIXe7q3RhRJPd9vTtkUKqbYsDl2A8cOTZxjgSAkYWMqfraXBq6ed1RRm@vger.kernel.org
X-Gm-Message-State: AOJu0YynxWU+9W3U4fMwHb1mqMdcimkBUgyu40gD2DqVzMbTTdX7pJyZ
	E4pUnMBfwEt0g2DJKbA2kVQUmYfHMZPIzQWJcMspSkea8pENfLHkXIQN
X-Gm-Gg: Acq92OHKiZj9nta4X0uOnQHeJmMuYoAg6ZdrxwJNHBDxR23bGqZhsenOX61S3G2ZaaF
	wYHLLeN1rCyMa7yN+1uAi8DkHzIiYCy6NU7/OS2ZoRKNaSY7EEW8iSqXUsQJfJTTewlbf34/f0C
	oD1/aq0SxYo+1Cm79JVWvz2+JAxyzU+8ol+Tn6SlG0ohPDP688y0sJCoz68Vgsqi38zMZON8GKk
	I3FuvCQo4d4+iplC835cf5wmuL0LrrLSnE7s/wPNM3H5aEb3FEeqsSDk69vpgOyPBvW8UnG/gwV
	xjPpwfbcRVi/sz/u3OFY2e0tzoCXO3L2PIrop5iLjkKpKVrnR71M34OdRmyjBnh4k7fPXSpStdQ
	8nAnZrgrO21l0XO0YRAPELw/FWq2ion/e5nROOmvvCmLav6lRltUJdAHIdtUf/bP1Oqv6Uc5DKG
	y0TDQehYt9QU9uwAyCJtSFM847iR//lIukR0wg+ucCNeuj
X-Received: by 2002:a05:693c:2c01:b0:2c5:b23e:48a9 with SMTP id 5a478bee46e88-2f54b266964mr6364127eec.25.1778250636710;
        Fri, 08 May 2026 07:30:36 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2607:fb91:1bc2:493c:ac39:c332:9a80:788a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm2749565eec.10.2026.05.08.07.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:30:36 -0700 (PDT)
Date: Fri, 08 May 2026 07:30:34 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 =?ISO-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v11_07/15=5D_platform/x86=3A_lenovo-wm?=
 =?US-ASCII?Q?i-helpers=3A_Move_gamezone_enums_to_wmi-helpers?=
User-Agent: Thunderbird for Android
In-Reply-To: <0d4c9865-de40-39b3-20fb-398f8480530b@linux.intel.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com> <20260507180507.912966-8-derekjohn.clark@gmail.com> <0d4c9865-de40-39b3-20fb-398f8480530b@linux.intel.com>
Message-ID: <69290AC0-839A-4F8E-B272-4128A617A503@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 8, 2026 7:21:22 AM PDT, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@linux=
=2Eintel=2Ecom> wrote:
>On Thu, 7 May 2026, Derek J=2E Clark wrote:
>
>It seems there are a few nits still to address (they were too many so I'd=
=20
>want to try to do inline editing)=2E
>

No problem=2E I'll try to get v12 done today after you're done with the re=
view=2E

>> In a later patch in the series the thermal mode enum will be accessed
>> across three separate drivers (wmi-capdata, wmi-gamezonem and wmi-other=
)=2E
>> An additional patch in the series will also add a function protoype tha=
t
>
>prototype
>
>> needs to reference this enum in wmi-helpers=2Eh=2E To avoid having all =
these
>> drivers begin to import each others headers, and to avoid declaring an
>> opaque enum to hande the second case, move the thermal mode enum to
>> helpers where it can be safely accessed by everything that needs it fro=
m
>> a single import=2E
>>=20
>> While at it, since the gamezone_events_type enum is the only remaining
>> item in the header, move that as well and remove the gamezone header
>> entirely=2E
>>=20
>> Fixes: 22024ac5366f ("platform/x86: Add Lenovo Gamezone WMI Driver")
>
>This change doesn't seem to exactly fix anything so it shouldn't have=20
>Fixes tag=2E
>
>We want to only have Cc: stable in the prerequisites for some other fix=
=20
>that comes after=2E
>
Makes sense=2E I wasn't sure, checkpatch flagged it as missing a fixes tag=
 and I figured it was easier to drop than to have you try and find the orig=
inal commit=2E I'll drop that for the formatting only patches=2E=20

Thanks,
Derek

>My plan is to take patches 1-9 through fixes branch and then merge fixes=
=20
>to for-next and take the rest through for-next=2E
>

