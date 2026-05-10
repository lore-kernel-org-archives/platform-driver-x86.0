Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9747E287268
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778417154; cv=pass; b=pVh854Jl1lTmODMgcgRlJySNw0reAOgtquQFbcbjvknSiIdrE8Yy9yH+ncnni+R+kKeVjs3wU/ZTLDqU99wb61Mia7eVJc0zPeJBX+zdqlUST+kjPk7p7bwoHy+QoNFKvIpBhjfVFjlYO35I7CuCyJYkMmDCaySG+Sfpxk//6DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778417154; c=relaxed/simple;
	bh=rKyIdsTi/PThFtRHIjPywtjegtI4JA6+rbnyfoqG6xo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Dy2SQeM/MPoYvsEC+69i+/Dpk5e4WmWzciIW/fURq2j3F1ImLIWw65jeRoUBP7zHsMKyLPUu6FkselOEkylPkrBzdGD9ebc0GItxO7Cgqh/UoJoRLCqgTcc46T712xf0WIvTeZdn7gmRSEeHE5wO1LdI+OMiKCQpbB3IqyHtyA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDX8WDER; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDX8WDER"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-47c7b282e21so1355539b6e.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 05:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778417152; cv=none;
        d=google.com; s=arc-20240605;
        b=V2ZcHPZJYNDJanWyp30WUY90i6JpLZq/eoyjdcqmkP/CkS/+900+r7ZxceHMqhR78i
         JL8/BsHe2A5NwQHgKfVkAB6UGDxJW309gTNJmiSAG/xO08EE+QqgsD/CY0dOoeurTTh/
         A+nFEPyxS/K6IUOhaYHPsxYCFf+X4DaTLbphDGbHal8Fw7UuLGcSnmj0KS1nonOgASYR
         2QKciyILzmaNaeieKp/o42xZIzqSTcU9r4oJ3gU+JKyRCdurP2CR4DpWY5BCSAmtxZft
         m27PFNlQSjFOnYgAZNeHFio9DVwMaT5DMvZwK5zdvhfsR6OS8Gsz6Z4XrNHXndCOsJwb
         dTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rKyIdsTi/PThFtRHIjPywtjegtI4JA6+rbnyfoqG6xo=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=PiFTOe8JrNEJsVk3GI+7fGw2PdoFj0+EfKeMKz2czUwXIbI6c7qhw631oec0jEzDWd
         pw0z0glt4I0b7C3kiho+68UO/dhVdRNWrSVzal/Ig+P1LYHgYg0/1QoPfgdZGwASQI/3
         p5N11AXd03Lsu3MnTTWTKZyQUJr2Ppqr5qsOq6rgTqV+bVzLzOETy+jFIw0McogZNRfB
         g0TfC+9upw8eXlJOsLujhK/rHdsG6bsnlttiOPLPmha0kmJKnCXouuSSXOWbVM4P1kL2
         EHW2pbsparGiUDytKujk/JK7Ga3J28MdhtnAkOHJ2FDQrQRmJvSRkSqUTcdSMuLbgKIE
         BODA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778417152; x=1779021952; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rKyIdsTi/PThFtRHIjPywtjegtI4JA6+rbnyfoqG6xo=;
        b=EDX8WDERCTY9kd4hqwZ6brqWOK4/TBwpbeNKMFCgNCFR66lMU0KcglYenVsQTePxaJ
         EEoPDUYVHKXz040GYzST9z0vptPncZ8kSaU58omLEKho7rEUNynqqWgi7A5Ch0biQUPh
         AaaJpaX1ppZjkOH27CTpiNChXMGOtzyAdqQo1c5scFXn6u59BQyYzfWwbGJg/p4MOPQD
         CxQ+d8m7lcRmb9gd0jf1GqdTQURq6X06rSfO/y5lGGUFdxMVvEGH+ubGzwC0rxUNRxB/
         kfrmiyUZ3u5nhNQOdY8lUQq6Q9AO2R/Cw+rRLIRxTs50yGFhIOPHIh/NlqpgHdvj6/55
         oJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778417152; x=1779021952;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKyIdsTi/PThFtRHIjPywtjegtI4JA6+rbnyfoqG6xo=;
        b=n6OSjAbAhkRaBqw+phsXDzpgRJxEWqXsQGXGw53miqLxDq6rcW4nrpWVfWrnuNhXPt
         saeKDX8J9hVNqmqZ8Ukh9Ad+Zmwf+KVthzzt4JFhTCrId/4fr1vAeyPyDa3H2EqxwQYl
         XTEuKJq2yof9iU+ltVpuEGKY9a3loHc7B7b34uCdWrw/tregO0tMrzEu/3t3QsnfF7Iw
         09hqeWR5Ic6diIvUT+3rnMw97jsS6qyjx/b9TeBxSF3L2GHsbCe3IBbC6RKyAoxhbf89
         X/p3WFKeNQwx/DTZ2tPeexb1nTGWP4B0k4+57K3cCk0z4QwlIWMjW0Qb1Q1F3mmSyuty
         0GvQ==
X-Gm-Message-State: AOJu0Yy3EgsmwgRDw0FCZi94nxKsqkBgf3d0H6wXaPd3swBiTgSZpWmH
	cea2LVmDLHA/gR0moUWYsTNWwZfnVzSOFoF1q9NiiIUJLOukP0dcJZRzcCvDyUQOz95wQCHZLZ0
	GQKoeytZsFZ3wFsm9CYz6+R+Pal2cnEqdHrme7XrbcA==
X-Gm-Gg: Acq92OE5rHv8WDn5Db5l6dRwo8GOGC0mQHqd6w30ERhC2DxREYsgKveIEfjguTudvrU
	EIqUW8MRk7JvSwxm3ffU4Mqx4DieL/LzngvEN36Tb/XXBdesvK1ZGhSKsAorjnfWUfQgH1fjBCd
	E3vljSXWFevFuzYEcz/n/nY5DOQDqmf31ZC6L2Qki+B85kqa9Y5pG3P9jDSEwIM7QP2UU8+uWoU
	QEjZgcWMeU10/F9Y1r0Ha3j4mXuYRs/WFK/cmL15TkN+NAhXaVW2Cn/K4FRQCrP1I3A+D5SglVd
	kRvIpO5VZx/sJL08MQ==
X-Received: by 2002:a05:6808:508c:b0:47a:8c2:a571 with SMTP id
 5614622812f47-480424eee71mr12892966b6e.33.1778417152350; Sun, 10 May 2026
 05:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Enzo Bartolini <enzobartolini28@gmail.com>
Date: Mon, 11 May 2026 00:45:40 +1200
X-Gm-Features: AVHnY4LLT1LrYOGWC8pnMys7UgQXPU1sBIJwwRBq17EwIjFs38G2PDm_9zl4XhI
Message-ID: <CA+voBNJ0NjgYJY-pHMH0zuqCmg6yD7+PdkUc414bfPi945k0Dw@mail.gmail.com>
Subject: Bug Report: hp-wmi: Unknown EC layout for HP Victus 16-s0xxx (Board 8BD4)
To: platform-driver-x86@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a0f2da065176021d"

--000000000000a0f2da065176021d
Content-Type: multipart/alternative; boundary="000000000000a0f2d8065176021b"

--000000000000a0f2d8065176021b
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting an unsupported EC layout for the hp_wmi driver on an HP
Victus 16-s0xxx laptop.

I have attached the raw diagnostic output generated by the
test_hp_wmi_raw_payload.sh script for your review.

Please let me know if any further information or testing is required.

Best regards,
Enzo

--000000000000a0f2d8065176021b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"font-family:&quot;Google Sans Text&quot;,sans-=
serif;line-height:1.15;margin-top:0px">Hello,</p><p id=3D"gmail-p-rc_04c962=
0cf56af5b1-64" style=3D"font-family:&quot;Google Sans Text&quot;,sans-serif=
;line-height:1.15;margin-top:0px"><span style=3D"line-height:1.15;margin-to=
p:0px"><span class=3D"gmail-citation-99" style=3D"line-height:1.15;margin-t=
op:0px"></span></span><span style=3D"line-height:1.15;margin-top:0px"><span=
 class=3D"gmail-citation-99" style=3D"line-height:1.15;margin-top:0px">I am=
 reporting an unsupported EC layout for the </span><code style=3D"font-fami=
ly:&quot;Google Sans Text&quot;,sans-serif;line-height:1.15;margin-top:0px"=
><span class=3D"gmail-citation-99" style=3D"line-height:1.15;margin-top:0px=
">hp_wmi</span></code><span class=3D"gmail-citation-99" style=3D"line-heigh=
t:1.15;margin-top:0px"> driver on an HP Victus 16-s0xxx laptop</span></span=
><span style=3D"line-height:1.15;margin-top:0px"><span class=3D"gmail-citat=
ion-99 gmail-citation-end-99" style=3D"line-height:1.15;margin-top:0px"><sp=
an style=3D"line-height:1.15;margin-top:0px"><sup class=3D"gmail-superscrip=
t" style=3D"line-height:1.15;margin-top:0px;font-size:16px;background-color=
:transparent"></sup></span><span style=3D"line-height:1.15;margin-top:0px">=
<sup class=3D"gmail-superscript" style=3D"line-height:1.15;margin-top:0px;f=
ont-size:16px;background-color:transparent"></sup></span></span></span><spa=
n style=3D"line-height:1.15;margin-top:0px">.=C2=A0</span></p><p id=3D"gmai=
l-p-rc_04c9620cf56af5b1-64" style=3D"font-family:&quot;Google Sans Text&quo=
t;,sans-serif;line-height:1.15;margin-top:0px"><span style=3D"line-height:1=
.15;margin-top:0px">I have attached the raw diagnostic output generated by =
the=C2=A0<code>test_hp_wmi_raw_payload.sh</code> script for your review.</s=
pan></p><p id=3D"gmail-p-rc_04c9620cf56af5b1-64" style=3D"font-family:&quot=
;Google Sans Text&quot;,sans-serif;line-height:1.15;margin-top:0px"><span s=
tyle=3D"font-family:Arial,Helvetica,sans-serif">Please let me know if any f=
urther information or testing is required.</span></p><p>Best regards,<br>En=
zo</p><p></p></div>

--000000000000a0f2d8065176021b--
--000000000000a0f2da065176021d
Content-Type: application/zip; name="hp_wmi_logs.zip"
Content-Disposition: attachment; filename="hp_wmi_logs.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_mozrmtop0>
X-Attachment-Id: f_mozrmtop0

UEsDBAoAAAAAAJkDq1wAAAAAAAAAAAAAAAAvABwAaG9tZS9lbnpvL0Rvd25sb2Fkcy9ocC13bWkt
cmF3LTIwMjYwNTExLTAwMjg1MC9VVAkAAwJ6AGoCegBqdXgLAAEE6AMAAAToAwAAUEsDBBQAAAAI
AJkDq1zfZUGYdwAAAHwAAAA5ABwAaG9tZS9lbnpvL0Rvd25sb2Fkcy9ocC13bWktcmF3LTIwMjYw
NTExLTAwMjg1MC9zeXN0ZW0udHh0VVQJAAMCegBqAnoAanV4CwABBOgDAAAE6AMAACXIuwrCMBQA
0D1fkV1Sbi6mlkAWEXRwcBBXuU2DBs2DJIX07x0842k+uNooZIOAowAlpLwDaJy0gp1EDcA+rkT3
NYcBBiVQWLLvLVU2JyrLM1JwZjqe9iyXtKy2/efhbVsrnzd+ufEzBR9f/Eq5pczlKCr03tkPUEsD
BBQAAAAIAJkDq1xGeVTtZwAAALkAAAA4ABwAaG9tZS9lbnpvL0Rvd25sb2Fkcy9ocC13bWktcmF3
LTIwMjYwNTExLTAwMjg1MC9sc21vZC50eHRVVAkAAwJ6AGoCegBqdXgLAAEE6AMAAAToAwAAyyiI
T8rML05OS1dABpYGhoZGCgoGXBkF8eW5mQrowMTS0BQsD5SMT8rNT0OTNzQysrCAymNoBuk3sDQz
UFAwVYCYr1OWmZKar5MHpDITQQLxqcnxSYnJ2TmZ6RklOhlwR+rA7OMCAFBLAwQUAAAACACZA6tc
eG6v9EMBAABwAwAAPwAcAGhvbWUvZW56by9Eb3dubG9hZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0w
MDI4NTAvZG1lc2dfaHBfd21pLnR4dFVUCQADAnoAagJ6AGp1eAsAAQToAwAABOgDAADN001PwkAQ
BuA7v2LCCRIppQIiJ0tplIQKgsgBTbNlh3bDttvMbvn49xY1HDTxpAnn2Xn3ObyzmhcZBOwILRsc
p+/Y/U4XHNvpvkGSh/tU9GGRbTO1z8D3QLKjKgxsFEGkGHHoDYZtC54TpJRJyElthEQgZDxi6y3s
hZQQIXChWSSRWzCVyPTpRa7IgEmEBqMgl8yUoWmDk9ghNQ697t0uRrK2SBlKS1FcWf2U3nyTzjAW
2iAhB6bPoWdWwjIukX5Lcr3pCHwiRX1wo5IoshhSNIni8BrOB9YyGA2t5dPAA17gB51wJ1ShAU9b
UHP90A3G4WTqz9zHYfjijhd+HWplfKfltJxmrnNGGhsd57b+JxL/QiQPXnAhksB1/1tSNi4SSq83
8al1pihbyr/+sA/Xtt2+guo9Zkhi3ZyY8jw+h9XKO1BLAwQUAAAACACZA6tcHXZwXdYCAABJDwAA
PgAcAGhvbWUvZW56by9Eb3dubG9hZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0wMDI4NTAvd21pX2Rl
dmljZXMudHh0VVQJAAMCegBqAnoAanV4CwABBOgDAAAE6AMAAK2XS2/UMBDH7/sp8gWGnbHHr0qL
5CdwAPXCGZV2kVZqKdouFL49E1oEBzYapERWcoiT/8/jeXm3203bhx8P249fH7aPd4ftzf7b4Xr/
MO12u83p/nR1O+Hm5vj4/QjzmMx0vL8/Pd1wenv1YyKaEC+Mn178PY8X5r3Y3M4Tf42Jzk9El5CM
IWjOeyBqBMUMBMSMNaE3iRDITPBS/rl9Gs/42y+3V6dP98e77eW7S6zEF8jz8j48L3N+wl+vlFKr
gicluDsP7pTgaU1wq+Sm89yk47ZrYjsltjmPbXTYbk3sqMS257GtDjsqsYl7ToE91E4DGFOEjB0h
ILtauOXADsivEZZKKS34IJtLGOCNQWAzr3nEDrEU1wP1nnwCXsNNdEpqbK6JeoFWXQX2WCA5alBD
Lalwic11IG1ULttbJ6UENyUSW4rApcstYIDUIkOmhDm6VFyT3ERrgCul1OCVU+sDQiEHPNDNOxeg
dxtKchyqGEbLvZgGdUpa7EbEhROYNgowWYQSRwfOtmLqwZG1QFoHX7a3TkoJbo0ZBk0EHLJnLLkK
UpRwQXIUPHLqpgGFNcCVUkpwNyTI0TKY6i2w6wlKTwS2MXdTxQ07g7bOL3LrlJTYHq1kILLQhxGv
s1bSqpUAqewpyN75Ji6I/8a+PqBcF4h/wPE8OG51WkrwmJ0EebYQbBIrNCdrDqlCTBytM6bbKO/W
qJg6JSV2MrG4LDGSW5C0Wq2HxD5LJpUCHLH20Am0BXMRW6ekxXbDsAlSqVoo89aJDWwMkGtt1Yc+
PFWgM37yf+6tlNKCx9gwdgs+Dp6t4CAP28FnkjqBfkQrf9M2hMvgOiklePajZyuft1yk3/HDQRk1
zpW4SRCVXtMA7YFnsfDolLTYpVQc4maxZ3pqL+fOEn63lvMFpO1kF887SqnNRs6v0+vL6dX7N236
dLg97Y/7m2n/+XQ8PB9ulRlV65k/AVBLAwQKAAAAAACZA6tcAAAAAAAAAAAAAAAAWgAcAGhvbWUv
ZW56by9Eb3dubG9hZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0wMDI4NTAvd21pXzVGQjdGMDM0LTJD
NjMtNDVFOS1CRTkxLTNENDRFMkM3MDdFNC05L1VUCQADAnoAagJ6AGp1eAsAAQToAwAABOgDAABQ
SwMEFAAAAAgAmQOrXEF03RBTAAAAcwAAAGIAHABob21lL2Vuem8vRG93bmxvYWRzL2hwLXdtaS1y
YXctMjAyNjA1MTEtMDAyODUwL3dtaV81RkI3RjAzNC0yQzYzLTQ1RTktQkU5MS0zRDQ0RTJDNzA3
RTQtOS9pbmZvLnR4dFVUCQADAnoAagJ6AGp1eAsAAQToAwAABOgDAABLSS3LTE61NXVzMnczMDbR
NXI2M9Y1MXW11HVytTTUNXYxMXE1cjY3MHc10bXkIkYZl35xZbF+Ummxfnlupn5KUWZZalGxfkaB
blJmfnFyWjoXAFBLAwQKAAAAAACZA6tcF7D+qykAAAApAAAAZgAcAGhvbWUvZW56by9Eb3dubG9h
ZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0wMDI4NTAvd21pXzVGQjdGMDM0LTJDNjMtNDVFOS1CRTkx
LTNENDRFMkM3MDdFNC05L21vZGFsaWFzLnR4dFVUCQADAnoAagJ6AGp1eAsAAQToAwAABOgDAAB3
bWk6NUZCN0YwMzQtMkM2My00NUU5LUJFOTEtM0Q0NEUyQzcwN0U0ClBLAwQKAAAAAACZA6tcU/xR
ZwIAAAACAAAAbAAcAGhvbWUvZW56by9Eb3dubG9hZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0wMDI4
NTAvd21pXzVGQjdGMDM0LTJDNjMtNDVFOS1CRTkxLTNENDRFMkM3MDdFNC05L2luc3RhbmNlX2Nv
dW50LnR4dFVUCQADAnoAagJ6AGp1eAsAAQToAwAABOgDAAAxClBLAwQKAAAAAACZA6tcv6muhwMA
AAADAAAAZwAcAGhvbWUvZW56by9Eb3dubG9hZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0wMDI4NTAv
d21pXzVGQjdGMDM0LTJDNjMtNDVFOS1CRTkxLTNENDRFMkM3MDdFNC05L29iamVjdF9pZC50eHRV
VAkAAwJ6AGoCegBqdXgLAAEE6AMAAAToAwAAQUEKUEsDBAoAAAAAAJkDq1wAAAAAAAAAAAAAAABb
ABwAaG9tZS9lbnpvL0Rvd25sb2Fkcy9ocC13bWktcmF3LTIwMjYwNTExLTAwMjg1MC93bWlfOTVG
MjQyNzktNEQ3Qi00MzM0LTkzODctQUNDREM2N0VGNjFDLTEwL1VUCQADAnoAagJ6AGp1eAsAAQTo
AwAABOgDAABQSwMEFAAAAAgAmQOrXLkibfhoAAAAvwAAAGMAHABob21lL2Vuem8vRG93bmxvYWRz
L2hwLXdtaS1yYXctMjAyNjA1MTEtMDAyODUwL3dtaV85NUYyNDI3OS00RDdCLTQzMzQtOTM4Ny1B
Q0NEQzY3RUY2MUMtMTAvaW5mby50eHRVVAkAAwJ6AGoCegBqdXgLAAEE6AMAAAToAwAAS0kty0xO
tbU0dTMyMTK31DVxMXfSNTE2NtG1NLYw13V0dnZxNjN3dTMzdNY1NOAiRh2XfnFlsX4K2OBi/YKc
xJK0/KJc/QC/AANnQxMrAxP98tzM+KTSYhitiyRFpEP0U4oyy1KLuABQSwMECgAAAAAAmQOrXOdJ
JA8pAAAAKQAAAGcAHABob21lL2Vuem8vRG93bmxvYWRzL2hwLXdtaS1yYXctMjAyNjA1MTEtMDAy
ODUwL3dtaV85NUYyNDI3OS00RDdCLTQzMzQtOTM4Ny1BQ0NEQzY3RUY2MUMtMTAvbW9kYWxpYXMu
dHh0VVQJAAMCegBqAnoAanV4CwABBOgDAAAE6AMAAHdtaTo5NUYyNDI3OS00RDdCLTQzMzQtOTM4
Ny1BQ0NEQzY3RUY2MUMKUEsDBAoAAAAAAJkDq1xT/FFnAgAAAAIAAABtABwAaG9tZS9lbnpvL0Rv
d25sb2Fkcy9ocC13bWktcmF3LTIwMjYwNTExLTAwMjg1MC93bWlfOTVGMjQyNzktNEQ3Qi00MzM0
LTkzODctQUNDREM2N0VGNjFDLTEwL2luc3RhbmNlX2NvdW50LnR4dFVUCQADAnoAagJ6AGp1eAsA
AQToAwAABOgDAAAxClBLAwQKAAAAAACZA6tc17Kq6gMAAAADAAAAaAAcAGhvbWUvZW56by9Eb3du
bG9hZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0wMDI4NTAvd21pXzk1RjI0Mjc5LTREN0ItNDMzNC05
Mzg3LUFDQ0RDNjdFRjYxQy0xMC9ub3RpZnlfaWQudHh0VVQJAAMCegBqAnoAanV4CwABBOgDAAAE
6AMAADgwClBLAQIeAwoAAAAAAJkDq1wAAAAAAAAAAAAAAAAvABgAAAAAAAAAEADtQQAAAABob21l
L2Vuem8vRG93bmxvYWRzL2hwLXdtaS1yYXctMjAyNjA1MTEtMDAyODUwL1VUBQADAnoAanV4CwAB
BOgDAAAE6AMAAFBLAQIeAxQAAAAIAJkDq1zfZUGYdwAAAHwAAAA5ABgAAAAAAAEAAACkgWkAAABo
b21lL2Vuem8vRG93bmxvYWRzL2hwLXdtaS1yYXctMjAyNjA1MTEtMDAyODUwL3N5c3RlbS50eHRV
VAUAAwJ6AGp1eAsAAQToAwAABOgDAABQSwECHgMUAAAACACZA6tcRnlU7WcAAAC5AAAAOAAYAAAA
AAABAAAApIFTAQAAaG9tZS9lbnpvL0Rvd25sb2Fkcy9ocC13bWktcmF3LTIwMjYwNTExLTAwMjg1
MC9sc21vZC50eHRVVAUAAwJ6AGp1eAsAAQToAwAABOgDAABQSwECHgMUAAAACACZA6tceG6v9EMB
AABwAwAAPwAYAAAAAAABAAAApIEsAgAAaG9tZS9lbnpvL0Rvd25sb2Fkcy9ocC13bWktcmF3LTIw
MjYwNTExLTAwMjg1MC9kbWVzZ19ocF93bWkudHh0VVQFAAMCegBqdXgLAAEE6AMAAAToAwAAUEsB
Ah4DFAAAAAgAmQOrXB12cF3WAgAASQ8AAD4AGAAAAAAAAQAAAKSB6AMAAGhvbWUvZW56by9Eb3du
bG9hZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0wMDI4NTAvd21pX2RldmljZXMudHh0VVQFAAMCegBq
dXgLAAEE6AMAAAToAwAAUEsBAh4DCgAAAAAAmQOrXAAAAAAAAAAAAAAAAFoAGAAAAAAAAAAQAO1B
NgcAAGhvbWUvZW56by9Eb3dubG9hZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0wMDI4NTAvd21pXzVG
QjdGMDM0LTJDNjMtNDVFOS1CRTkxLTNENDRFMkM3MDdFNC05L1VUBQADAnoAanV4CwABBOgDAAAE
6AMAAFBLAQIeAxQAAAAIAJkDq1xBdN0QUwAAAHMAAABiABgAAAAAAAEAAACkgcoHAABob21lL2Vu
em8vRG93bmxvYWRzL2hwLXdtaS1yYXctMjAyNjA1MTEtMDAyODUwL3dtaV81RkI3RjAzNC0yQzYz
LTQ1RTktQkU5MS0zRDQ0RTJDNzA3RTQtOS9pbmZvLnR4dFVUBQADAnoAanV4CwABBOgDAAAE6AMA
AFBLAQIeAwoAAAAAAJkDq1wXsP6rKQAAACkAAABmABgAAAAAAAEAAACkgbkIAABob21lL2Vuem8v
RG93bmxvYWRzL2hwLXdtaS1yYXctMjAyNjA1MTEtMDAyODUwL3dtaV81RkI3RjAzNC0yQzYzLTQ1
RTktQkU5MS0zRDQ0RTJDNzA3RTQtOS9tb2RhbGlhcy50eHRVVAUAAwJ6AGp1eAsAAQToAwAABOgD
AABQSwECHgMKAAAAAACZA6tcU/xRZwIAAAACAAAAbAAYAAAAAAABAAAApIGCCQAAaG9tZS9lbnpv
L0Rvd25sb2Fkcy9ocC13bWktcmF3LTIwMjYwNTExLTAwMjg1MC93bWlfNUZCN0YwMzQtMkM2My00
NUU5LUJFOTEtM0Q0NEUyQzcwN0U0LTkvaW5zdGFuY2VfY291bnQudHh0VVQFAAMCegBqdXgLAAEE
6AMAAAToAwAAUEsBAh4DCgAAAAAAmQOrXL+procDAAAAAwAAAGcAGAAAAAAAAQAAAKSBKgoAAGhv
bWUvZW56by9Eb3dubG9hZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0wMDI4NTAvd21pXzVGQjdGMDM0
LTJDNjMtNDVFOS1CRTkxLTNENDRFMkM3MDdFNC05L29iamVjdF9pZC50eHRVVAUAAwJ6AGp1eAsA
AQToAwAABOgDAABQSwECHgMKAAAAAACZA6tcAAAAAAAAAAAAAAAAWwAYAAAAAAAAABAA7UHOCgAA
aG9tZS9lbnpvL0Rvd25sb2Fkcy9ocC13bWktcmF3LTIwMjYwNTExLTAwMjg1MC93bWlfOTVGMjQy
NzktNEQ3Qi00MzM0LTkzODctQUNDREM2N0VGNjFDLTEwL1VUBQADAnoAanV4CwABBOgDAAAE6AMA
AFBLAQIeAxQAAAAIAJkDq1y5Im34aAAAAL8AAABjABgAAAAAAAEAAACkgWMLAABob21lL2Vuem8v
RG93bmxvYWRzL2hwLXdtaS1yYXctMjAyNjA1MTEtMDAyODUwL3dtaV85NUYyNDI3OS00RDdCLTQz
MzQtOTM4Ny1BQ0NEQzY3RUY2MUMtMTAvaW5mby50eHRVVAUAAwJ6AGp1eAsAAQToAwAABOgDAABQ
SwECHgMKAAAAAACZA6tc50kkDykAAAApAAAAZwAYAAAAAAABAAAApIFoDAAAaG9tZS9lbnpvL0Rv
d25sb2Fkcy9ocC13bWktcmF3LTIwMjYwNTExLTAwMjg1MC93bWlfOTVGMjQyNzktNEQ3Qi00MzM0
LTkzODctQUNDREM2N0VGNjFDLTEwL21vZGFsaWFzLnR4dFVUBQADAnoAanV4CwABBOgDAAAE6AMA
AFBLAQIeAwoAAAAAAJkDq1xT/FFnAgAAAAIAAABtABgAAAAAAAEAAACkgTINAABob21lL2Vuem8v
RG93bmxvYWRzL2hwLXdtaS1yYXctMjAyNjA1MTEtMDAyODUwL3dtaV85NUYyNDI3OS00RDdCLTQz
MzQtOTM4Ny1BQ0NEQzY3RUY2MUMtMTAvaW5zdGFuY2VfY291bnQudHh0VVQFAAMCegBqdXgLAAEE
6AMAAAToAwAAUEsBAh4DCgAAAAAAmQOrXNeyquoDAAAAAwAAAGgAGAAAAAAAAQAAAKSB2w0AAGhv
bWUvZW56by9Eb3dubG9hZHMvaHAtd21pLXJhdy0yMDI2MDUxMS0wMDI4NTAvd21pXzk1RjI0Mjc5
LTREN0ItNDMzNC05Mzg3LUFDQ0RDNjdFRjYxQy0xMC9ub3RpZnlfaWQudHh0VVQFAAMCegBqdXgL
AAEE6AMAAAToAwAAUEsFBgAAAAAPAA8AJgkAAIAOAAAAAA==
--000000000000a0f2da065176021d--
