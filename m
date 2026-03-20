Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BFB285C9D
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774008029; cv=pass; b=kjquAct553Cxpgjtdo/Dy3ldObsBK5uxWbqsnXBkfy5W/7HCEYV9XgLGqidrXyS21Iv4ha1mMhchj7X9yw6DdQjweQnA+uVHUx0fNE4i2KPiiqn3c7gtF8PqYK34PTC3ik+snWbrZd+DybVSudbSD9mcENTHp6BPXsez+KZCCDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774008029; c=relaxed/simple;
	bh=u8FgmePH5W1C8PSh8xytKveQ0U5dvU8NsJlnM0mszI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkzaC1HB3zLgs3qjD+2rYhx8AhWUfKReJEw57e/jMZQowgmFInf8R/qsqJ97WaB7sYaT58c8kBgWc0Xs8rO5rqgAt47ndUkAsfsZ6UU4mq42zVP5uiC11KZeBVSuHsEeRglQlT63Xr3Qt3n07q1FUdjHPC5YYRCvfSO1i6XIea0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2BQBD0E; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2BQBD0E"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6674cba2c50so4045311a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 05:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774008027; cv=none;
        d=google.com; s=arc-20240605;
        b=CvIqrVRKmlYGyUUa3gOx9zBiZvt/WeO7FnTY+2ixie7fdK7+WA6kwA28Aa4smfQcmY
         Sg5e2ofNAJhFB1DEl1moIdcPuerXdDAOVjt05Q3y0m7fCUS9QQzcXjGnOwpPr2BZ4qQ2
         owoVcad7bh/oyW8vXK/gfzPXJLZNzlgTJZ0lFbbNrPg1ePEnZkXI1TSf7FamEpLmVder
         CfMmhsX1zzKGuCwzoOXrDXq1d8HTT0fTedqRAgCE+b4Xl+TUyf8ONik6KShfviP9qdV+
         jRSJ0cFnhIbwGHaPqscT8clJv4ZX//Yx1LmDIn6Wfuxn3Va9t2k6wk3bZiugh21Q3xhB
         nxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u8FgmePH5W1C8PSh8xytKveQ0U5dvU8NsJlnM0mszI4=;
        fh=jw3sQeh2ZWnAtudSEVcl0udI9yaHxEOvGYfSRImQnXg=;
        b=RoxYjc+jOfCy8yhp2VeTZX4FJoZk4RwGOqa44bowQpEqfFvP6ifupoE6bqlGvJ5hL3
         1AvtYpfaEdSW+j8ZxlVt56/5CiZ0RXo7j0n39FA5xtY9wZuh+kB2rAymykfKO/aDHzQB
         gis8meUF6VJqIHpXV6k6XnI/gC4golGAhpX4mxBwt2dpSFgBjos1PV2usL+ATMUlGMEV
         jjsJBmQREYHcS/2UTAHC/mPsgX9B9xvYL4yjULRSdienb6fxfMTuqEqRi91XFRvFXJ0P
         HPsHjgMBxem80PR5CO6Gi5khh15QcTz9AnGE8lsAC7597WFVzfNPO9AwpwD2/HpoVywl
         UIIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774008027; x=1774612827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8FgmePH5W1C8PSh8xytKveQ0U5dvU8NsJlnM0mszI4=;
        b=V2BQBD0ELSVHngxV7CP4yjd8ggXO1QUZuT1EgqavZZd2LKbtMlszNtaDygMrH4y+mY
         4wmAMqtRucWazkFXutTrQWevSvvplJcSw4mgeqz+4faDn1l+CER5UV/GznKj8hHrUm9m
         Q1yxHCo0cLxf3HMgKDETBOIVWDohcbhgf8V0/au75L8z4xrU2pz28sMddZgvGOtNSZ0/
         Gjt8NeYy+7oEdzgqqXhBZ1vs4VWAzyYzTQUTO+fj7bMvrNyvYaqpTTV5AJ5jMTMrS11x
         p31YDRtXF1QlhEnDNVzcVBDtSDxdu/N4uOvtL7iV0VVJgqn2iTrKjxuzZ1E1W69NfboY
         F8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774008027; x=1774612827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8FgmePH5W1C8PSh8xytKveQ0U5dvU8NsJlnM0mszI4=;
        b=ilCNpjj6bhR7/RcRRJ2GbacfXPslqlH3sxhHyws3KIN4ksutywVw4w4OyawF8EJSq9
         qu1Q34+4/4VH8DpFAjZlgnOY6SxM80AhefR3wA/Zfkyd6BSNInQq0g9w6+8OiVL7lGvM
         6T0g3mGSOzLaFK5w+dkTZnJknjKr2Q16nj1NTHmMEiMODTGu98XyPlsEBV1ZfMhGpBbo
         gtB/piT7926Ivc62Tf6FeIsCG3VR/qQDsBj0FbQytZcBIzQ8HENfLNBL1b/DJ3rWb50W
         5GbTgniicsxjKeMJS3QDasusbDaFNjvFwFfsh3N9cusAsZfYsEmdpQ91oCEBJZX2KIyh
         T4hw==
X-Gm-Message-State: AOJu0YyN2OjsL0/RNHWJM0DFQXDq+RtYkYdtjNrjDsuODwTeFOJN+dD5
	1ECClRWSRj9HSy2UyoMzuRu7ulY1q6xbgpmn9X2LugbRgBmqsta8tvPQINZ7GR8+AJwmLypNF51
	IvoFSQXQ0p+RmGGiXn5jkpXgHnzQ4CXs=
X-Gm-Gg: ATEYQzyxS58NWiYakx6mEF55/3Dv60i2rJiE/SeX0+1dQj2UbOpmyzvjlaXubSfZIYj
	pmKCTx02ZPWj8SqYRs370pSOS5SBrXsovzeGxg0RlcSTCUnCaqesFjn6nEHUZjW/0A7MONVqmwB
	JzheoUfOSrPvwH408777Qhp8DND3YR+T6YC25oX1eRvWAsDIa2VV5N6Lo1sdL6mbHFFxXJzgspL
	kyjzSS2l7Gq3cam3okt8aFu41PF6dLgxMHukGyPV8zDImZ+uy54hGIVh7vY9PmtLCbpuSe2hz4G
	bRd7rH4ZD6VgF4+q8IwlJc4HFCpH/fecINNk4b4b1UyJ5pZ2e0/nwQLVU1bG8zWJFOfm4pcBodo
	HZ5IOjkE=
X-Received: by 2002:a17:907:398c:b0:b97:a4b1:51b4 with SMTP id
 a640c23a62f3a-b982f59564cmr170359466b.17.1774008026522; Fri, 20 Mar 2026
 05:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ab0UvRdDpvZBiNsC@spark.kcore.it> <CAHp75VeiNd2Ptj9aoZcmSO-c+-RQG-R7kxpzyk3edKU2Ur05Gg@mail.gmail.com>
In-Reply-To: <CAHp75VeiNd2Ptj9aoZcmSO-c+-RQG-R7kxpzyk3edKU2Ur05Gg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Mar 2026 13:59:48 +0200
X-Gm-Features: AaiRm52DA23bg_QNGpCjENwN2PXu80wcziqv3AiCKNN-UnxQ_bCoaZ_QliTVWyA
Message-ID: <CAHp75VcgDdhf0w0J-cG70CvDyomPSA+huaBpZYdO=AsDDnQrCQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: int3472: Add GPIO type 0x02 (strobe) mapping
To: Marco Nenciarini <mnencia@kcore.it>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, 
	hao.yao@intel.com, hdegoede@redhat.com, sakari.ailus@linux.intel.com, 
	andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 1:57=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Mar 20, 2026 at 11:35=E2=80=AFAM Marco Nenciarini <mnencia@kcore.=
it> wrote:
>
> You sent three emails without versioning (no new versions) and no
> changelog. Please, slow down with that, it's quite confusing. The
> recommended period between two sequential versions is 24h+. Also see
> more comments below.

One more thing, this was sent to a partially correct list of
stakeholders. You need to use get_maintainer.pl to see who is required
to be notified with the proposed change. I have my "smart" script [1]
which does this for me based on some heuristic. Feel free to take and
use that.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.=
sh


--=20
With Best Regards,
Andy Shevchenko
