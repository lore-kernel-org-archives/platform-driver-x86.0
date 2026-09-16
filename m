Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEDF4B1D0F
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789590676; cv=pass; b=M/d90qD3azYqXhAn4ZUKfFXee1aCNOf9fEby2p2dEgP2V1pVn4R/UyKbDOpfr4K/Qv5um2mE7aM0/KU3HdvukZGLL2yMcf1FJULWGL48Zev/WnmS3Kcc8DlH1c9TFDf/3RJ6mVjrCCZEa9CUrhQXSlHq3Eh2ZszGKmmYvm0ouD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789590676; c=relaxed/simple;
	bh=G3zVfl1/na29i79t4HxZrzQpGfHgd/dNtdPq394Flfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K35TBuwo1pPYA2ulwisY9RTmNqLl1fe2CWTE3px5pTjdz3lxYkHTmRO6xnKVWIUYul9LonoiOaWuH2NDZXlhGsn2HuYvTfITBqlXAqmvgJQ2SAPXdvuSXXWU8VaPPqYmEE7wagUfo+HgHvLBu8uS5JSMx3RgcT8lvinjafwOMR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=k50Z20r6; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="k50Z20r6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so78967f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 13:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789590659; cv=none;
        d=google.com; s=arc-20260327;
        b=atQoN7uczw+OzM+/kCPGLrylH9SGPjHBC3G1oBNMygof2WQaJNYTQPSxr2gq5BrsX4
         +1PWulKkz34irksVvknkWMPCSpW4PpF2PKrI+7Z3xCxKybMRBM1Yiw6zEXmLZ2NJedOm
         +oYzZ53FcMnU4um081J1YOBVs/k2eiJYp6BS3YzPed6JfBlLSAY6+YM3iB+YCPBGdVeP
         d7CRiwzqyFp7hvFjGbZN8ZFuPR/o5NaN6MvA1vvrz3BQ+UZh5IoXowUjicx6xD2ARPz5
         FROUPA46TAeSkoH/ZsQa5G0I58AymkroZRBD5DEizFDpSgDVcMEe0XxQ82Bd8TiFZjWR
         MBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W5pxHTrfs+GW0hVGwxC0S7jNRcDjOR4yV/CxTiMohJA=;
        fh=Np+EdOq028fPtpPw46XF5JZpnQPHfO+AwlBH+S0HKOE=;
        b=WjjwZlr5iiOYrtse5ubbtJKV+oumCtnRX/ic0+i3mtHqT8T7TsEQW5AdaMbd9zS6CX
         tdA27AOhSIzxFANNUtfYeSA6HwEBf2D4oEzkgvrpJ7VxvqX2MYF7OC3Fgl409NHRQF53
         wCqBiWF9/CHSPCt+vTm7Z3vDcVw6xfjmGbacaW4Fne1F+7wikjjyrE2gDf8DQS1H+XX7
         W0muPwd4ohawau9oerH+8Nr0HKX8d6jYaw+/l25o6beKo6o8iVCv/8bYVdneFNjGotCF
         ZDIISqOf6sIN3Dg1ZZ/cte/Syt4cURQ/WuHI26if1pVcVIj4BVLE4UQEPHN+LX9tPG3N
         +i/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789590659; x=1790195459; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5pxHTrfs+GW0hVGwxC0S7jNRcDjOR4yV/CxTiMohJA=;
        b=k50Z20r6gbRkXYJ0e50V578N9sLrcgg/7sSqIpuszz0YYVkw8NAeVz2vu0vbOdcTt9
         Uear/5wl7mVfh0qHNHsacttvKARrzQjslbXjsB+ZJcdQGYNaQ8UwC9BsPCW5pXyUk5VA
         66hXZlfgM8TJf8Z+H3wtoi3KoJTnGqxOPVjEJC+w34FvTSdAD7oTnx9U1iypOGNKiDJ/
         rU85tXQsa/WgjOrNMsgkvb2AqPlKnC9XZHlKG29O//mGZmlIMkNLF42kq9uy3MEUU6I2
         ael9qvqeg5iFGI434X4I466X6pdiWVApMS9o7Balx+16k96hCL1nCwxIOf0FLYKPhI95
         UgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789590659; x=1790195459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W5pxHTrfs+GW0hVGwxC0S7jNRcDjOR4yV/CxTiMohJA=;
        b=PAyitg98ezsriGNci1sqF0ZHp45XhE9oI1wducTyemHlFXZOVEKWB9Yuc/18cgav1/
         5egT0aO6Y/mA1Q/mGeAymlyeIrPo5VlykVI/SWrWGMvHFp/Q1ba5e1vWQuqmTK0HO4A4
         xD8Vc6qE87phXvzqUDBgMx5WlWmlP5301GaTwHVSoE4yhdoCSu+n55m5w+XsP6Ihgqhy
         3SfggLms+ufLg3uwfuJ6tb9rLo5WC/rO4uE+8oAS8YepQb2GiXEO+lKYSHh5kuvfHZt/
         iva0Eh86YMxJZrGnut8/GOUirRzqfPNFynSBswfX8xOALUbR/EMppMz6P1PRv3Lzdd2i
         ui9Q==
X-Gm-Message-State: AFuF++mKoVWXei9UzsSr9Ol8Gx18JIAgljkrsvTTq3vL1lf8/8L0Qk/A
	I8Rg+WHKhhk2B31eXYKAr0IuX1vjQQqQz2/4hbVK/ImThm8pnspIO5LXKz6sP4k44aEOK35L50G
	TEpaeeGOwRSBM4A4OWoyn3c9az6F1Bct5GB1bcOA=
X-Gm-Gg: AYBFou0lc6wxrTHonJrLY7JXIebHQg8DrzjJaVzr9qu+wpAzdJnN2/MxAYDWmF8nzCl
	noJD51SPhGKGOCTgcLRn5096/p3/7nPloeLtlGmIH5F0lF7rDrWETzH5VqbOtj2r9mLb0kpCpKV
	FO2lIaoLkGNKF9z3FAuZnnyJvxBFyVLYKEzrVYBqsyG0YRm+wxZbxH58l8Fc2tqNx0xskvYziYv
	ZmjCUSNoqNHgLuQvTbbWulVrg+J90+rZDg3fUYOjan0AKaWoRwKaY3360LdP+CQ7kWQ6j5G0bi4
	TEy5dl11YRAduQENi1De9hbYN5mteZ73pOLzXfby1JmomQhArVTUN4I=
X-Received: by 2002:a05:6000:402c:b0:487:a36:b2db with SMTP id
 ffacd0b85a97d-4870d052620mr4930706f8f.49.1789590658550; Wed, 16 Sep 2026
 13:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM=nh0S9e1+_U4WGR92HwOrNC2h2xYb6eKvgN5_skg-vvbSbqQ@mail.gmail.com>
 <d8d7a246-00f4-42a5-881f-66839eb6b302@amd.com> <CAM=nh0SB5uhsqGyH9v_1N1oZsv94SmrJTqWi_0YVbULgY-c_aw@mail.gmail.com>
 <c733990f-844c-4ba5-85fa-a0dad627ecad@amd.com>
In-Reply-To: <c733990f-844c-4ba5-85fa-a0dad627ecad@amd.com>
From: Karsten Wiese <fzuuzf@googlemail.com>
Date: Wed, 16 Sep 2026 22:30:45 +0200
X-Gm-Features: AcwNN1WKv7CaNi_QTv0xYctQjSvPHF1bxsb-ON97fYSduw019hk8yfeKjDemKJ8
Message-ID: <CAM=nh0QY9-G2PJKpyrXe+h1FHvc1pv6v0-AKgPuMRQC=QtbRZQ@mail.gmail.com>
Subject: Re: amd/pmc
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mi., 16. Sept. 2026 um 22:05 Uhr schrieb Mario Limonciello
<mario.limonciello@amd.com>:
>
>
>
> On 9/16/26 15:04, Karsten Wiese wrote:
> >> * What issue were you having before?
> > The system would hang on suspend to RAM infinitely. Sometimes it
> > suspended, but the fan kept spinning.
> >
> >> * Was it a problem on every single time, or just sometimes?
> > Sometimes it would hang on the first try, sometimes it survived some
> > suspend_to_ram/resume cycles.
> > When the fan kept spinning, I woke it up and suspended it immediately again.
> > It never survived more than 2 weeks with some 3 cycles daily.
> >
> >> * What is the new behavior with that module parameter in place?
> > 17 days without the fan keeping spinning or the system hanging on
> > suspend to ram.
> > Followed by restarting into a newer kernel.
> >
> >> * What BIOS version do you have?
> > MDCN30WW
> >  From september 2023. Should update.
> >
>
> Yes; before we pick up the quirk, can you please try to update to see if
> it helps?

The latest BIOS Readme doesn't sound like updating helped:
-- Excerpt start --
Summary of changes
==================
General Information:

MDCN40WW:
BIOS Notification    :
1. Fixed
  1) None.
2. Add
  1) None.

3. Modified
  1) Optimize network related logic.
  2) Enhancement to address security vulnerability LEN-198949.



EC Notification    :
1. Fixed
  1) None.

2. Add
  1) None.

3. Modified
  1) Modify the combination keys of fn which fix some key may been hold.
-- Excerpt end --

No Windows on the Laptop, will take some.


Thanks
