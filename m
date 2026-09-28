Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197CB41D217
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594062; cv=pass; b=tGNPjv5ONgSlp4eLXlE02s3Rm0/6X0ExWh/yQ9M8JPQ4hDdN4aYPbxdcAL/M7BtFttTzHBpW+iHTg+YW6FukspV+bhm9fcqeV2eXk2OSUZIGiBkYaJV5836JNChUpoQlAIyjgJZBtO55E0olOGwHLR9qPqelBsiz+TSDV88INi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594062; c=relaxed/simple;
	bh=/DAVvdogxhr4aw+TdCwzR90WEM8/dhA6niCwPDVgB8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=miJAlDTUKQTkZ+2d0Dcd5FhHcMHMIngA6FrpU1Nr65+IQT6Iw+sliTt5X+Z3dhzk8voRrDvTpGqRF+9BJIWNFkEdFpzdDjTnoHq+h+fohTg6R5iH0LjHuwyRgcNTtFYONm6d523NZweSkFZtiW+Vnu+0cpZPcBF+pKhZvGn9CYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=K0N/4NHN; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="K0N/4NHN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so22988865e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 04:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790594059; cv=none;
        d=google.com; s=arc-20260327;
        b=piqaDt1WkkKmTW8PoNMi0vdLrmvi8ykIJDzsU7vVWHMTjdMfBa50ABb55ZHxbbDIg+
         EK69NZ4R2E2b3j9PVWOrPPpdf1UBS04jOaqbs9RMw7N4bBFntZqUwUMjq8ARbVWh2gD4
         vfbmum8Mg/plpSFDPzRcOhuR39Dx+y9XJusETUZ1oXsIopRqSv3EHhX72aXUBuRRE+Lf
         Klb5Ya9PrjBRK14lbrAO3mZ/+NFeJjiBaUInzS5SGnFzRsJdn8Q/lae9pJCciOsX48EL
         Wedv9UpUHj3HF+qUic1W+Rblc2UE8sviTD+RWVNZuxAqiSRHdW7iQ0qHHSClyqcsR6M3
         f5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jb4DJqviad1NhK/Ray7KAKayfrSCN0jSsMROvtgP/x8=;
        fh=Np+EdOq028fPtpPw46XF5JZpnQPHfO+AwlBH+S0HKOE=;
        b=Uw8tOKgkqOBc2E/BoysRfa1CPlBpWg1d7khXRi6RiZ6ikn62BETijKz8z3V/SfCTw5
         PnE/X6zFEofM/OtG0SyCsIblqhMVfI1lTu3cKlcOxCIpvp+o6G6XCrMn9jzI1KDESrxf
         08GzITPIDwomwjxNztGxCnxmCo+M9iLV/VhKrdEnkSWMVKUMd+94yV0SWlxsxZq46qNo
         Gspsu3IzbcBLNkSYeAvmC3n1LpzjU6T76Uxut7j2Qw33REm+ffVG5UGTHaNn9oJCQcuM
         A0dHCdfd0BhW7+9258UfVSdlpueMoJkNOgGb7iaGlGIKHSHModBN+ZDinNCQxgVQB6D/
         5RnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790594059; x=1791198859; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jb4DJqviad1NhK/Ray7KAKayfrSCN0jSsMROvtgP/x8=;
        b=K0N/4NHNMiZIoNVhzGH7wNd8Mn/KVDqXP9tVkpo3J3YSKVIBXJS7zr98mZ5qNBPzfn
         Amg5zGF/IHzyEHPfG8g+Xhkrq1RhmtN2gDwEHWhSvXTiYu7TuDbUawpeaGB+k+2hQGBR
         jzl5mfMgK/DOMITkiU4yQICQMzDrj+sZk0ivlYUQzIEtUiRBnl7swW+L+Umge9q4qGhY
         vK6fLW1g5X3gnQSQvIPr3h5NuqALqM+3z1xPuoJb294oxg5X3wpUt2lvF3k0+Ws66/Et
         yN8u+drunbSn24S1gJI4PEdw6dwWgP1wM2DebJ9b7LstfviclnpaJtaWGZSouWJ3LGU0
         Kdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594059; x=1791198859;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jb4DJqviad1NhK/Ray7KAKayfrSCN0jSsMROvtgP/x8=;
        b=djO64kO9AIUS1Elg4dXB7LrrKDanoHosaYUa7lLEwGyKF5jaabrnuqDYoP93+Cjhdv
         4tL2fJNmaHyb6o1dyK1SIe8DOeWXl+37aD6v+W89p8BkNYIsVnYaXNT7cLVr41mdRv+g
         HU+jUd9Tne6kwykcAy8f2bBobDl7CndyjHk33OnZ4hVAPa4QFMBKaLgqhpFGqv9sgQlp
         1q6bpMeWhlrFJyZAKXnJc8+60TrVFLPwKYBQKVcLgpxW1JW6iUneirSpjRoiA/btW+QT
         EbcIa8LiN7SyzMCu05oXmYEjkQWrtKm/917n6cNNGx/qQuGAj6zvPtQQ1phVQ+AC1qOT
         J+QQ==
X-Gm-Message-State: AFuF++moTZHJXAMWYYvAC9GabXx/lMThK0k2AMJqa/Z2gI/o8NeDmsQf
	P1G2y8HRnY6RBD2CHCAZNNMyizwd2IT9Qt3Y47NQtzOBNec7xdhoKLIICbo+2/fHo47oDoFjdB/
	7/zz+9h0NZ4H+NyzE7kUcIwfbxiNYZs3sJiOWVzo=
X-Gm-Gg: AYBFou0In1264gQkis8NT0V6ZfMGOAr9sQR5QbGk20aJ/AE6V33oCmI87Y4N5I6jrQW
	noRlp2WfzFYEYUqCznN/+mKD6uKBJ8ensMoOdV58vJ+8/qEKbN3UX+7EpW6WLAqO79Ljw1HFbfv
	86SMbbDrSC+9arYRlZ2Jx6dSAeA/TBuqO4YZzfmLkpIT6l8zeoYIhWjQZb3eyUfeNFDqc2ZuNCQ
	daqOnE470ipSCD2RbKNn0vPEJYhk2Wxcc9YudGWgfnFkznn6Bu25UZd9UIPcV1AhwFBrj+5U7Fv
	/rxdC1nAdGFylHLk3J/yvX6oxbGuGcPxzerLPcrassEwMr+Z547UKTA=
X-Received: by 2002:a05:600c:8b6e:b0:49c:fc6e:8cbb with SMTP id
 5b1f17b1804b1-49fe66f9fe3mr223609255e9.31.1790594058993; Mon, 28 Sep 2026
 04:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM=nh0S9e1+_U4WGR92HwOrNC2h2xYb6eKvgN5_skg-vvbSbqQ@mail.gmail.com>
 <d8d7a246-00f4-42a5-881f-66839eb6b302@amd.com> <CAM=nh0SB5uhsqGyH9v_1N1oZsv94SmrJTqWi_0YVbULgY-c_aw@mail.gmail.com>
 <c733990f-844c-4ba5-85fa-a0dad627ecad@amd.com> <CAM=nh0QY9-G2PJKpyrXe+h1FHvc1pv6v0-AKgPuMRQC=QtbRZQ@mail.gmail.com>
In-Reply-To: <CAM=nh0QY9-G2PJKpyrXe+h1FHvc1pv6v0-AKgPuMRQC=QtbRZQ@mail.gmail.com>
From: Karsten Wiese <fzuuzf@googlemail.com>
Date: Mon, 28 Sep 2026 13:14:06 +0200
X-Gm-Features: AclHuK_JrYebsDVgn6F5qWRagF7dwyBtYeu7dQSOnASaOXRh66IsHXCaWaA0Dr0
Message-ID: <CAM=nh0RbdpmEbKxyfbk1JNEjT0iXmBKMyJuxf0TRNwywHVOLHA@mail.gmail.com>
Subject: Re: amd/pmc
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mi., 16. Sept. 2026 um 22:30 Uhr schrieb Karsten Wiese
<fzuuzf@googlemail.com>:
>
> Am Mi., 16. Sept. 2026 um 22:05 Uhr schrieb Mario Limonciello
> <mario.limonciello@amd.com>:
> >
> >
> >
> > On 9/16/26 15:04, Karsten Wiese wrote:
> > >> * What issue were you having before?
> > > The system would hang on suspend to RAM infinitely. Sometimes it
> > > suspended, but the fan kept spinning.
> > >
> > >> * Was it a problem on every single time, or just sometimes?
> > > Sometimes it would hang on the first try, sometimes it survived some
> > > suspend_to_ram/resume cycles.
> > > When the fan kept spinning, I woke it up and suspended it immediately again.
> > > It never survived more than 2 weeks with some 3 cycles daily.
> > >
> > >> * What is the new behavior with that module parameter in place?
> > > 17 days without the fan keeping spinning or the system hanging on
> > > suspend to ram.
> > > Followed by restarting into a newer kernel.
> > >
> > >> * What BIOS version do you have?
> > > MDCN30WW
> > >  From september 2023. Should update.
> > >
> >
> > Yes; before we pick up the quirk, can you please try to update to see if
> > it helps?
>
> The latest BIOS Readme doesn't sound like updating helped:
> -- Excerpt start --
> Summary of changes
> ==================
> General Information:
>
> MDCN40WW:
> BIOS Notification    :
> 1. Fixed
>   1) None.
> 2. Add
>   1) None.
>
> 3. Modified
>   1) Optimize network related logic.
>   2) Enhancement to address security vulnerability LEN-198949.
>
>
>
> EC Notification    :
> 1. Fixed
>   1) None.
>
> 2. Add
>   1) None.
>
> 3. Modified
>   1) Modify the combination keys of fn which fix some key may been hold.
> -- Excerpt end --
>
> No Windows on the Laptop, will take some.

No more suspend to ram / wake up issues noticed.
Quirk not necessary for BIOS MDCN40WW.
Bios installation on linux from dissected update.exe worked fine.

Thanks
