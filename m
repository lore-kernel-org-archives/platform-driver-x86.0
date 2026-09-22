Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419A631A807
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043115; cv=pass; b=NUw6YymS62M/tkWcumKoVaV8SfkWNc2lel7YsDD53gYGZfvYIxsTbyFG8E4E32qgdOlahpsXbyk4aMpa7+Y7p1pnL4ZJ9tETxW6NN6OBHzx29/ZI+rS6E3eDVEyj9M9a8dttKKPpJxKIliVWW8/udxU+K8pmhqLFqHJJqYyCJxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043115; c=relaxed/simple;
	bh=RmO5GLrXflVxVmPF7qPo5gCMEyya6HFKnHxRxQwc4N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMxtExer6a7rgQltgJIRo2Egs/ZfFWIQHlqnBuaO9ftj5BFnGAIsHesNgQ/UN1Xou5AVNZQElltrBEWaN+3DNtEEabWtAQCMmuomSx5qxR31KWE7q8m5HDNYcGLPR7MEqX7jqtCOy0NMJaB/ac82/r4a88jojOYhRH6kXlD06cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cs2OCwuc; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cs2OCwuc"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac8d1eso27858217b3.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 19:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790043109; cv=none;
        d=google.com; s=arc-20260327;
        b=jEvXzuEucsekq3ufqwj75O2bvQ7Kcgn8jzC9StY1R1r//o4HLFexbMycShBAU43L4R
         VWaSSu7fGt0TqUQqMfcZ7DhqmyrtKoSqD7gEjFC12/Q8fmUCMYMlL2xfOQkjD2wuieif
         QzzQRqbqsMA7gKjXGAJRWmKVKyzCpZFCGjwObiSM6qbUzd8W6xj4EH/qyaX1G+mNQ1/8
         2HgNmUA1GVuYUO6/jjtXVWquVjI1HWH3TiPivUP+Hf88XrCIwjsfp0uy5hCOr+UWR7zU
         RbkOghCUTAk5l3Z91e+GvFNhDV4Ke/FYb/u+38wONPaOqxbd8jeubL56RWkYU1rsJ5lZ
         xi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WSqFKvA76kHZ8WDjK46gOjRVqZHbeKSy5ARU/kjfg/Q=;
        fh=3j7TnM/rFl66txNr3qekQb2miGbQgEp31mQhyixPYYM=;
        b=ebvYuQeWSGuPEnchBs18muM1PcBIMbyRBTEEKnw11PKN8LoX/XRs9fXr3tb4GAJolM
         /39i1jcGSAZ25D1Dk/CcypjBhJDU4N3n8Bc/H1NYcS/xjhqKA7kGb1XvLPk6QOK9vxid
         zTDryN8V8J1KULDjpzERYDVCnvt6KtJmbi80WC/MK46AO0lBBLhvb/k6TN2qQSZy/Vdo
         fjgQI6ugffGvBTkftEe9AxmRywa0oDLF7APYVH15YeN84Gd49nwo2CefwxYpLfo69TPP
         cgZkglsRdQvIgX77cHxhkVvRgYH2a6pgrxE5RMvO0DHtu2ZZR+6MHV4VCyxpDsqNdRPg
         zhdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790043109; x=1790647909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSqFKvA76kHZ8WDjK46gOjRVqZHbeKSy5ARU/kjfg/Q=;
        b=cs2OCwuc0eStrOhMReEqbKDwoowqPnRikJEKPI+HTe2oFFAHlK8CrU0Q7J71OQHocb
         C0hAx+bNYenHHqkyv4Ai3KfxI+5LRuPQf12xhrF+16Q4J4CtYOaCf6m/WGxpLp5Z60XO
         lGp5HfkQt9QM6+cfbxWB8L0qJg2dAB5Rx6151nXkofO/39Z6ExjyMJ5kaXymmtGnGsia
         K4/udMHrtHkg+/4hzHTTaD/YQ21XLr0bM4SURTbquQzqsO1wdbCySw3nwUUzGbkIsrxP
         Fe0SXHUJse5Ii5lCMycW1yXXZl75jE33jfMsfRLFJY1gV80hX6m9A8Q1SjlqvkP1h0m9
         qTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790043109; x=1790647909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WSqFKvA76kHZ8WDjK46gOjRVqZHbeKSy5ARU/kjfg/Q=;
        b=UTf+yA+2Dx3kF6vMJlQMeoIsn4aySiIgTSc0ZeP5Efro0o5204m8cPUJcLQkdbxb9k
         ixOuhTOr09E18iOwCywcDoROp67wPmJdN1ED3/oO2Izq0bsFkRmXlk2hC7Tx+3a+96mh
         kIfl4EDQK/V0i9SRyrM96gc7sfNhlYU5KtoEAHaB59rbNgbCJEIj780j2hNdobV7JcjN
         KyPmEw0hF/eBslq5SvG28SP5YQXRurEpqz1ZMxz1BwM0Ub3xmrKsQ9mC64Rfza6LwnQm
         bOSj2kkHOqHkcQ3ciIzwnxCzUpye6t/MfHZ2VlJ4AVV5kW6vo5O2znP54hnz8MCCNBed
         g3lg==
X-Forwarded-Encrypted: i=1; AKwUvBw8zIPtbU1MDSwCFmELFM/DEomvs1CPQbbJ+SjEdw7UilBCoZTKeYk9TsL9p7qNOzetI4Js7cUNSYUOEsGs9kdZ5KW4@vger.kernel.org
X-Gm-Message-State: AFuF++m/m4ktF3YtmGu3xgtF8IoNWAPV0gtCBW5ei3qO1LGdc7EH5Ttn
	SpfsfPZVlEgkyj1GtGqh8OOwfyAySqV0ovfcxh3/mjCfbEsUbc2k6clVQVi6TTcdYm43E7aVp1a
	HeMox96ij5DpkUfYdwQaJ3wrwKT9CRxs=
X-Gm-Gg: AYBFou358R3OW5dkeQ1Yha3o/1n8OWQD+yLV2kqZjA3mVbuyX7yYcCH6aR8Nt3dHuh7
	CCOeEfjAKUqFXb1Bh79ChcAtXRDuYlQNV/8Qp7aZbm8X6NMk9RpZxDiFKfVuICc09XLFAEfu2HZ
	C7rO+mOx9CjB8V7ZhaRUt446fm5dDW0resI51zqiSo5Lm2vyvvKTpdp2pINyo2BXjCw854y7/3b
	fd9OFKFRy0hdxlx9+bN+9l4s9wH5e3j6Wngwem8I9GXGzXzl2ucXeTgccpKNXvgefwJ7FmnFRWD
	wc+BlCTzwxEFwSMmSYDSMO/05XKOCCOvODWnr+suSW089PBo3bUXNNPcEZ0=
X-Received: by 2002:a53:d006:0:b0:671:3b1b:997d with SMTP id
 956f58d0204a3-672c54d38a1mr307218d50.88.1790043109182; Mon, 21 Sep 2026
 19:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921082609.244774-1-lgs201920130244@gmail.com>
 <arFKFmkpldopUIMI@quoll> <89bd2593-e0ef-4b9b-8c9b-833aff327a3e@kernel.org>
In-Reply-To: <89bd2593-e0ef-4b9b-8c9b-833aff327a3e@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:11:36 +0800
X-Gm-Features: AcwNN1ULcRqBryBnufCeX7rqeQatFi1km04Dy1jR2ehl0tsOS-FvTsDL2fGI_aw
Message-ID: <CANUHTR91qqHtCbaFHSqcMa8eZuD7EnTqyFSfDMwX=LsiMiHoEA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/amd/hfi: fix platform device leak on init failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Perry Yuan <perry.yuan@amd.com>, linux-kernel@vger.kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	stable@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Tue, 22 Sept 2026 at 06:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 21/09/2026 17:15, krzk@kernel.org wrote:
> >
> > On Mon, 21 Sep 2026 16:26:09 +0800, Guangshuo Li wrote:
> >> amd_hfi_init() registers the HFI platform device before registering
> >> the platform driver. If platform_driver_register() fails, the function
> >> returns the error without unregistering the already registered platform
> >> device.
> >>
> >> Since the failed init path does not run amd_hfi_exit(), the platform
> >> device remains registered and its reference is never dropped, preventing
> >> the associated platform object from being released.
> >>
> >> Unregister the platform device when platform driver registration fails
> >> to properly unwind the successful device registration.
> >>
> >> The issue was identified by a static analysis tool I developed and
> >> confirmed by manual review.
> >>
> >> Fixes: 5d902ee5609a ("platform/x86: hfi: Introduce AMD Hardware Feedback Interface Driver")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> >> ---
> >>  drivers/platform/x86/amd/hfi/hfi.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >
> >
> > You sent multiple independent patches, to multiple independent
> > subsystems. The amount of these patches clearly suggest this was
> > AI generated and most likely not tested.
> >
> > More importantly, you sent all this work without properly organizing
> > relevant patches into patchsets. This makes reviewing difficult
> > and might cause multiple reviewers to address the same issue.
> > Replying to the entire set is impossible and requires handling each
> > patch independently, instead of applying or discarding the set.
> > Maintainers also won't see the bigger picture of your work. Quite
> > worrying.
> >
> > This is on the verge of hostile patch: bomb us with so many
> > contributions, we won't be able to handle them in efficient manner,
> > like responding ONCE to ask you to slow down.  Considering all this
> > is untested and LLM generated, I have even more doubts whether this
> > should be considered for review.
> >
> > Please read kernel documentation BEFORE posting more work. It will
> > explain you how to identify subsystems, how to organize your work per
> > subsystem, how to document usage of LLM and how what you should not
> > do if this was posted in a good faith.
>
>
> Apologies for spamming here, mistake on my side.
>
> I guess the OpenClaw on the other side did not even notice...
>
>
> Best regards,
> Krzysztof

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
