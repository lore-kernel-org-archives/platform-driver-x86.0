Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902BA3815D5
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2026 12:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784377242; cv=pass; b=GQZ5A6uR1+5AmSzwSmUi/L7LJb4toPL7IsjPTWkSnxARhdGasvZFfOMasON1zHChdMNb6nCj4xctqXR4HdrOcb9kRajuR66xgz2spIEUqXPY9Psjl9SXy/UcAmsIsoFEnJOqe45a1zfHPGxIH1q6BqwQrMk5SefE/BwSpqESb+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784377242; c=relaxed/simple;
	bh=kb51xu1EdulY9DQ+T2cFMH8PphB1kTjbyua+gPeQz7g=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RI7CMu/2UV6mZe7ksb5Hwhg7nK/4RXm3c3l+0BU0o6at3XacrdYewBXeSxrNe8bFu9yJ9gXwjqm0IfW2JEBhI5rS47URfbK2Ryfq0bbVtY5sx7w8cPCPVJUWegr04G2HjorI8VsjbQrxQksMl1kmoU56/hnggS7J7Z0+VkKojqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLAdXrOF; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLAdXrOF"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66826484b67so3497952d50.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2026 05:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784377239; cv=none;
        d=google.com; s=arc-20260327;
        b=LsTUDIs+VQEIvQMIZOMOoqsENDp2qiNy3AJHaHad2O8R7Kk8mwvXCkMr8f2L3PYeIk
         YKtIjiEfeIA671Ypvz+qTtlJWmLAMNjUqLMzVhar8VZQauLjYgD/AXlCqHG5EMY5i0Fj
         UhblB29/KeqbgNJUupGymh5JAUMG2VpPhg5Z3CL/RBnHsiFJKmeRr2EBBl3h5jnr53Dt
         pKMiVouXzHuOgRmjDV0g/hrV887gARVSbHXV2EO7hAB3gDgzn/JDajX7+n6M0YWZVbvL
         dYIZ02VL8sxvOzCIJKcPqB3v/fqBo5X3k74L8T9eqZK7PYSCL64S3bfYr1bCZEHFnB67
         QqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=kb51xu1EdulY9DQ+T2cFMH8PphB1kTjbyua+gPeQz7g=;
        fh=ftt3RYphrVkIy0bzO0Jr1/b/9hAPM799PLCVt5iNvLU=;
        b=PI2zNo6uZlF9nhw+HpJCJL6w30ha0zpdEjTMWRsX4Pv+XyR52BAYjcXtB+n4KGk1pT
         s/rkZ4wkCe3LAZjMFCkDxq2fkeB7I0K8VAxvQgnOR5DYqcEhelgn4iJytCVFuQqJabdv
         ITn2EpfG7S9wxAM2gKLFwsBaR5GOip6IJQOGko0i943c0TOZQC964ZP4G2hHai63udE2
         N7yEA86DSDwHPdjZNKHCREszKRE8qlqt5AbajIOLP5L+gG9BfNpfMTDSzv7S+QkoKKcW
         QHWBbKK33bcBkQ7Nu47V+knU8LEByVlpEzZAmKwrB+pzBHYO51eJekFVcW2bMafkK8R1
         7xdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784377239; x=1784982039; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kb51xu1EdulY9DQ+T2cFMH8PphB1kTjbyua+gPeQz7g=;
        b=LLAdXrOF66qqLPucmrc3SFWZHbrC9beJ2bXvtipRTurlKEXxdfmvW0jICfmCo61jPB
         LFsbcQ/uy2AqerC2AUU+UPj4eq/3ly6zj9p22h97439SDBSIZUcERFxF7/2rEVjXmjQt
         uhON5YA9OyilwGmoaYcqQDYPZ5fzkTpabCuop/Ma8GgWYp+9gPNRFGRf5SCObrJUdebW
         HX8EhDtppW48/6SUlENOH92c3wgl67QsG1YuWMtUUTj7G9I+niH9O6qMt7ghIBUZw56U
         q2ng0teZucCu0rUPcDZw4fQhLu/RDSRhL4ZBFaMASehfXP87UKcZTCCmlN/IiOV/3bvq
         maBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784377239; x=1784982039;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kb51xu1EdulY9DQ+T2cFMH8PphB1kTjbyua+gPeQz7g=;
        b=bThq1aI2aKQR3uqX/OrNi253tQl0MuH36blXevMqOiyxcixdP9rCg/gQ3VJGbDFQ6g
         rUz/TleXOygKAaHxBh0ib5nMsPzZgddrjwiEfPgS5IS6/hf3+NJRN6zpZL1ZnzDkpRxw
         fQKDAMzBTDwgMI8TzTRVEzaviGCP+ZobjMw5wplErgOcQYYFQRgDsD7AF3g19B4xzxfp
         zXTL5AhWSrCrOLxHrDvSaQUq/FcIpP2o4Ju40a72K5zQ8IEMKTBNJCayHWyTA5VEr3TP
         b5+OtTyT0Tpymz1Sj6ajLdK/rpphY1u+fSCQV0U2Iri3t6rC1Llv9RgwrD03Zx0s042v
         oBhA==
X-Forwarded-Encrypted: i=1; AHgh+RrHIiUvAxirUD73Dlq9mIZ8ScnhH7FkM+/f+6HpjWov3G7qzc6t7mA3HX6/OpUXpYaPRnla2N3tn/fq091Q14/+n9Gn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+zDusKxGD31lxNdytjyoekh8kcmi0HeUGjszT9PX/bCZyYQ5F
	elBf7QfOKM0cC/Rkm0qobVVPQDPiHEqLFzGSWpx7ze+dUNspG4YISa+tlZZ9Mu5VyruzrUCl70M
	erLbA9xxLFWhJtI9lU3fIKQ5DSg+DXC0=
X-Gm-Gg: AfdE7cllmTANbHISCmjaFQXZhpGBJyos0zD+TM75BJKuP8BMVcBvem4YbudTN1cCJvd
	QCozPcBpmYTWzrCxC2Tkr25pfLSkC2iieEzgHFIIIdwBOqv75GgxVIL3MGMS/y0EyyNjnHb4iGL
	uyDpW2Cpj7/0SKY9UV5GoOolMFVJ2mObkbxX3cxirbG4u0ZMkbwq7KfEqxxijb3dNkfXADBenle
	Cd7szCJbU1AMbXpWBO/2fpKwieePMAS0GXE5Ak1Hsd5pWyxJPBmR7qtuKCGo5CvUrW0SHTwCuLK
	NfQSb5I=
X-Received: by 2002:a05:690e:484c:b0:668:2e0a:bb21 with SMTP id
 956f58d0204a3-6683bd18417mr1291270d50.68.1784377239524; Sat, 18 Jul 2026
 05:20:39 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 18 Jul 2026 05:20:38 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 18 Jul 2026 05:20:38 -0700
In-Reply-To: <jxbxgf7oxlv2tic2b4ck4sp4dp3ieebnekuhfiatjyxfpaddm5@akudfvxl5ush>
References: <20260630105125.54053-1-alhouseenyousef@gmail.com> <jxbxgf7oxlv2tic2b4ck4sp4dp3ieebnekuhfiatjyxfpaddm5@akudfvxl5ush>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Sat, 18 Jul 2026 05:20:38 -0700
X-Gm-Features: AUfX_myWpoOJGeNgbqCPT0VCY7MAcmVVuIzAlUcvqJqVslNy9EpXfxL3VZBxuGo
Message-ID: <CAMuQ4bUs3hpQ50+qd2nXvqhRij6zLM_jWLTgh0ZDjWQFYGuMog@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/intel/pmc: validate LPM mode without stale index
To: david.e.box@linux.intel.com
Cc: irenic.rajneesh@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Agreed. I'll remove that blank line in v2 and carry your Reviewed-by.

Thanks,
Yousef

On Fri, 10 Jul 2026 09:09:28 -0700, David Box
<david.e.box@linux.intel.com> wrote:
> On Tue, Jun 30, 2026 at 12:51:25PM +0200, Yousef Alhouseen wrote:
> > pmc_lpm_mode_write() compares the requested mode with the loop variable
> > after pmc_for_each_mode(). If no low-power modes are enabled,
> > the loop never assigns that variable and the comparison reads an
> > uninitialized value.
> >
> > Track a successful match explicitly, including the empty-mode case.
> >
> > Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> > ---
> > drivers/platform/x86/intel/pmc/core.c | 14 ++++++++++----
> > 1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> > index 9f77c0716e59..9833df172d4e 100644
> > --- a/drivers/platform/x86/intel/pmc/core.c
> > +++ b/drivers/platform/x86/intel/pmc/core.c
> > @@ -1147,6 +1147,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
> > struct pmc_dev *pmcdev = s->private;
> > struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
> > bool clear = false, c10 = false;
> > + bool mode_enabled = false;
> > unsigned char buf[8];
> > int mode;
> > u32 reg;
> > @@ -1167,11 +1168,16 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
> > mode = sysfs_match_string(pmc_lpm_modes, buf);
> >
>
> Since you're now checking mode right after assignment remove this empty line to
> tie it to the test.
>
> > /* Check string matches enabled mode */
> > - pmc_for_each_mode(m, pmc)
> > - if (mode == m)
> > - break;
> > + if (mode >= 0) {
> > + pmc_for_each_mode(m, pmc) {
> > + if (mode == m) {
> > + mode_enabled = true;
> > + break;
> > + }
> > + }
> > + }
> >
> > - if (mode != m || mode < 0) {
> > + if (!mode_enabled) {
> > if (sysfs_streq(buf, "clear"))
> > clear = true;
> > else if (sysfs_streq(buf, "c10"))
> > --
> > 2.54.0
> >
>
> With the above change,
>
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>
>
> Thanks
