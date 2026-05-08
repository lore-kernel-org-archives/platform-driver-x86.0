Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E7C3DA7ED
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778250275; cv=pass; b=mKi5fWCsTkr8n//g98C2aQRw3t0szglliVsbWMkcFnLwcIlyDXT8s9/3aa99CqE/j+lJtZK6Gk1WKjY3EWfAIn04EVWiuSYNS70b+ypJcmFI0KDLDSXgemI996SzXcILLpAn0IjYczGItszFeX8Tse51c0Zn5hGXi8UwSoXBpaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778250275; c=relaxed/simple;
	bh=244f8vM4AEH12bPto+HzbTsQELxNndItQjQ3Pjf0OeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEjpRPApCuanqwWJrXQE6BQog0DbUV+YFcSAATTAopCIWpxR8rQXDSB6SjD6WA13uxY8BoKWpBofcTix2LlWpLt6w6JSw8kyC33UG5xXZLqeTLqBOl2tUjWS0GPy6anltE2pRX85UOidT/xsjSp+iOolIzGkz08zEbusw3qZotw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MMtw6rrC; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MMtw6rrC"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bc2a455fd55so296699166b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 May 2026 07:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778250273; cv=none;
        d=google.com; s=arc-20240605;
        b=BMlmMT9vdi37YlAuSsbABrpi+zWexO1inqWJuNq9Mx08tZM8msgUWRKUcOxl1uYhKp
         zZwZ/hdLLu/LrUKg0vylTs3+lm16J4vocLE+/frbsYtpDbPhfHmnOOrkIjSHzjjYQASJ
         gxZzVP5US5z6NEHW6JEPbJGApTIiCPm161Z9TNHctTReOx+pSs/ULm20tQ/z3oNKbF0w
         FitVmwFtbJbqK8rAVkK9ToEAowONicI8AA5o9kyc+YOa/OShgJ0KPYpc8matjoCzjG0C
         TQqtPGeS82lKbwVS87HW5rPb3mzpowIQ0EdCVmiW7jRLgO0V5JKqQ8SMNwvz3WUaeXIL
         VH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=244f8vM4AEH12bPto+HzbTsQELxNndItQjQ3Pjf0OeU=;
        fh=YxGQKZ/DiCvJvIjWSaKjYqEjguimvIdpXNd84MpaDaA=;
        b=Xfby9Myvbq5z/ZDcg9eu6/xRHoNwWK4xsECvZiXKELTi7V6us0rytDTqoQvIui4Hj6
         IkmKJpPiKxmARlgHGQl3MRIOu7Knip4iyMYeY8dAprWid26SrIjmKoEs1rJmqpwOQqb7
         +5+PG/y/BX7zZKyjRq4CKO5lvqrhrVnCEFIIVDYeEYHWOO+/vQ0lkcUzzvofSEJFR4wQ
         EY2ht2Z5r3ZxXTo1XCCinwUfwxQUQY2zPmmmvWsQ8wO1BydS/nmoquAVhCx3efuDYUj8
         V3IjmT7dCQVrzXrJCGQoxXzrGXh22nKIhFmR9V6eauxgNuTzza0P8toFDD2gsPHmM0bb
         4R0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778250273; x=1778855073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=244f8vM4AEH12bPto+HzbTsQELxNndItQjQ3Pjf0OeU=;
        b=MMtw6rrCDzz+38iPA752cxOm2ogFqCLqpA5SL3rN/Gv3c26loTSu8kQBIFekZPlGwF
         j7/vIl3JdE1hG47D0R7YE4inTFh4O0jCfpAMexNXXoyL9PvhKN0KfnNQBnUwPT0G06XG
         UdSYJI29Aw28gqzdyck6VVDgj27JC8zwFnWOJ0M8MAsabk82tGvXznxyx3qixOJJrTMm
         sRXOBuaQQcSBuZfcCL78ilVguYXQhEMv6UPBvlWlzPPsRB9YRu14dS7dNcszrIWqWHWx
         /aBg17Z4UYojCvykTJlGsC1rnG/WUkHsrGIheI31RFXWCoySqL8tBsdZpkfdN2DjibS3
         zHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778250273; x=1778855073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=244f8vM4AEH12bPto+HzbTsQELxNndItQjQ3Pjf0OeU=;
        b=WVC3SCwiff1ZpqKprbOg2vaZDQZnTGS5UXhMWtRmUYw4j7yXfoIp884J/ySj90ax6S
         6kcxP6bumf+q66HjJueSrq9hQnBX0Jb9OCLGUNWM1pSiYovfnhRHrLEADDexvHa0G1hC
         iv5yJbWRyVJwElUj5kaQCd/UkF9kCv421saEbplITxffk5i6/JK0MGST1j3I4iVbXy2E
         sywivhoh6bMxwAkEaJSfWF5MDUfxnaSjmZJkqZI+XqH5qwnNLLZGYvtm4ENMVyJ9PWpq
         QP5hKwXjGs11No8Xz2zHutaWePrMRsykci2KoxspNxkLUTNtIcN840NH5gvuwDR0ooLI
         bOpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DPoE8yDKGkQG7ilpwiPzl2kUN/BWxQBFSChHZFwbhsMscrG5On7EBys6U/EsLThJkKMKnvX1gPIq7EwCJYWtIYi/D@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3gh/b0NCPb0fPjieYxYc5/SBkujiGLysiE0tlLqeJyuRp/Fjd
	YSDUv1RCDVmULY/vpFaI19Lv1Nj8R4cOMUkUmA/lqjvG1ldMgokiJ+6wBG9Ix1t9a6vOwEpV3vs
	aUrsZ1EfWoYRVZ0QpyPdDTonWzkZWgZJz5DAGvwcjCg==
X-Gm-Gg: AeBDievb1B3+Y6lf6HLPUZ2gBFTwrnTpNOP8OEggmmY4APMdcN5cU0YV9V8tnuxR8UB
	rzv+r1RHOOsZu+6vzQplE678w4COtmnke+lHI7THrsaHgy3Ef5w6sikuNR4XXPkB20XUehMEdgY
	+KUU1K3XBpJ7yRrwUI5t4T6zWG0wkJqiy8Z9uavrxJRcfh7Ak3Yj3WNs7FCaGUdSyFRGdV0ABou
	WAAV0VWfrHajkLluc0/ZAj8TzEhYJzH+5tk32db9iQRRCSBegwobjCX1JTRubqlbqB9eFRthO9S
	EaVlsrW1r+1yYQXiYMJk4fvRGvwMxJUXo8cC+xJenXFn6Ze603o=
X-Received: by 2002:a17:907:e106:b0:bc3:cb3c:2e2f with SMTP id
 a640c23a62f3a-bc56cc31536mr554867666b.20.1778250272637; Fri, 08 May 2026
 07:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507143953.342654-1-marco.crivellari@suse.com>
 <3af8e050-9934-45ca-8e5e-1e6a69909637@kernel.org> <6200c16b-74f9-9942-50f7-fc8dc04d2264@linux.intel.com>
In-Reply-To: <6200c16b-74f9-9942-50f7-fc8dc04d2264@linux.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 8 May 2026 16:24:20 +0200
X-Gm-Features: AVHnY4LqrdkdJpqk70rVY5Qb5tHcm4-V9cPzAx9XviqUumjco_lOwl_h3XJWzrg
Message-ID: <CAAofZF4ggLShHPZJJatM3rHMDW=VvG0tUddX8uX8-dL=Rc87hA@mail.gmail.com>
Subject: Re: [RFC PATCH] platform/x86: asus-tf103c-dock: Move long delayed
 work on system_dfl_long_wq
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 3:34=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> Hi Marco,
>
> Is there some particular reason why this was sent as RFC?
>

Hi Ilpo,

The only reason was to ensure my check regarding per-cpu variables was
sufficient and that there was no specific reason to keep them per-CPU,
and to comment on it if necessary.

Thanks!

--=20

Marco Crivellari

SUSE Labs
