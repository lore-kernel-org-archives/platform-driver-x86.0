Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C51CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 16:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbhK3QRl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 11:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbhK3QRk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 11:17:40 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714A5C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 08:14:21 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b40so55118297lfv.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 08:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NcZ+ijOJ3IckHAJBdQwr0BINmClMzrM+MqR2fRKc06Q=;
        b=mrAmiK+spbpZIigMTvf+ZKgP3lLVCA/dS6kJn5CGJObWEhEGPze8B8FdsHba27j9VL
         X0EDRAyK0V1rfR7rKHzETZrev3TKBrVw6gObhPOT8ohjCE1M+/urd/iI52UZL+f/6Rh9
         DE/nzBAE58wfOZDS9OmkuuIZlg0wIyhtPZCnpSI8Uf5G/wda2arpoGR0wciodX44nps5
         t7FV3/dscdYIhlZ9wKHoPw9Q1PpC8W5hzH1vCPefggI0b/4u4enYi9zUIRmr5jdbmXzC
         osY0V0w5lz2p3iyBGdqQFkErhVlFRAdNBqOC4++fG07z2E/FIsV9lxFhhizZiyxmfW3H
         jlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NcZ+ijOJ3IckHAJBdQwr0BINmClMzrM+MqR2fRKc06Q=;
        b=tDe6DIWLGIsMsgKsjm/c+mvYEzFlWks2CCr11vy3mVCpt2BIDT3Ll1sImXIAOXtkmO
         7lO7UFeMTuI9RSt3HS3ysflRnnV+5IcEF9cWXQjX4vdnc9clSUyS7mDbpOJ4ECZW+0yh
         Sxz8bn7YsyAIqFNfH1reH0YWYeEnl9YzL4FfLzzSTsHkPexcEm5RTSFr5kzb8mwBINa8
         QIHYvVUpkT/KiBi5f8KETH8Q1g8tHeYkkZPW/39TAv0YwiQAFHe79XLJJNEx7kBAI5xU
         u4Ws9jwy0z4hNu4acXa9jr8rOKPECgotrqjZ4rrg19S4kBsPNndzFlV39VAQ+a0S5OHI
         48cg==
X-Gm-Message-State: AOAM530P2KmSevUqkzni6RSIs68TRs4cJlD8RY5Stk46jL3raZt22JOI
        HkBuNPDp3UKEIZ8m+dFBCsHUP97Jix3oX0K0Vus=
X-Google-Smtp-Source: ABdhPJzkoHEr5ZcZTIdjYgvO7x+Aw/qhfidrYAvMJ15p11ArDNVyHElKffQu0Vkz0lThO42LiVdDfsNihADGMIL7HI8=
X-Received: by 2002:a05:6512:33a8:: with SMTP id i8mr140883lfg.497.1638288858303;
 Tue, 30 Nov 2021 08:14:18 -0800 (PST)
MIME-Version: 1.0
References: <CADtzkx7TdfbwtaVEXUdD6YXPey52E-nZVQNs+Z41DTx7gqMqtw@mail.gmail.com>
 <4a3d55d0-c53d-d0dc-8023-c059ddffc84c@redhat.com> <d594dad8-9bd2-dc38-c96d-9fd8699f286b@amd.com>
 <a8e11149-36dc-fe7e-3a08-d6f33a107741@amd.com> <2e85722e-e43c-b039-793b-473711a80bcc@amd.com>
 <68132e35-db47-0a7c-415d-7bf9e586eb30@redhat.com>
In-Reply-To: <68132e35-db47-0a7c-415d-7bf9e586eb30@redhat.com>
From:   Fabrizio Bertocci <fabriziobertocci@gmail.com>
Date:   Tue, 30 Nov 2021 11:14:07 -0500
Message-ID: <CADtzkx6sbC83sUFje5+_xwj56UoPgBG5+aRMMwdFTY+BnJ5pFQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] amd-pmu: fix s2idle failures on certain AMD laptops
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        platform-driver-x86@vger.kernel.org,
        Sanket Goswami <Sanket.Goswami@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Awesome. Thank you all.
I am looking forward to the 5.16 release.
Regards,
Fabrizio

On Tue, Nov 30, 2021 at 10:47 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/30/21 16:42, Shyam Sundar S K wrote:
> >
> >
> > On 11/30/2021 7:34 PM, Limonciello, Mario wrote:
> >> On 11/30/2021 06:29, Shyam Sundar S K wrote:
> >>>
> >>>
> >>> On 11/30/2021 4:57 PM, Hans de Goede wrote:
> >>>> Hi,
> >>>>
> >>>> On 11/30/21 05:15, Fabrizio Bertocci wrote:
> >>>>> On some AMD hardware laptops, the system fails communicating with t=
he
> >>>>> PMU when entering s2idle and the machine is battery powered.
> >>>>>
> >>>>> Hardware description: HP Pavilion Aero Laptop 13-be0097nr
> >>>>> CPU: AMD Ryzen 7 5800U with Radeon Graphics
> >>>>> GPU: 03:00.0 VGA compatible controller [0300]: Advanced Micro Devic=
es,
> >>>>> Inc. [AMD/ATI] Device [1002:1638] (rev c1)
> >>>>>
> >>>>> Detailed description of the problem (and investigation) here:
> >>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1799&amp;data=3D04%7C01%=
7Cshyam-sundar.s-k%40amd.com%7Ce8ed4219951f4df1dbe708d9b3f4761c%7C3dd8961fe=
4884e608e11a82d994e183d%7C0%7C0%7C637738684806355205%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
&amp;sdata=3DEwYxPgELsgQ2YpNQROFyptvt2Z0jQ0Yso8wptp6Dz4g%3D&amp;reserved=3D=
0
> >>>>>
> >>>>>
> >>>>> Patch is a single line: reduce the polling delay in half, from 100u=
Sec
> >>>>> to 50uSec when waiting for a change in state from the PMC after a
> >>>>> write command operation.
> >>>>>
> >>>>> Tested on kernel tree detached at tag 5.14
> >>>>> (7d2a07b769330c34b4deabeed939325c77a7ec2f)
> >>>>> After changing the delay, I did not see a single failure on this
> >>>>> machine (I have this fix for now more than one week and s2idle work=
ed
> >>>>> every single time on battery power).
> >>>>>
> >>>>> Signed-off-by: Fabrizio Bertocci <fabriziobertocci@gmail.com>
> >>>>
> >>>> Thank you for your patch. I've added a couple of AMD developers who
> >>>> work on this driver to the Cc.
> >>>>
> >>>> AMD folks, can you review/ack this patch please?
> >>>
> >>> Looks good to me.
> >>>
> >>> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >>>
> >>> Thanks,
> >>> Shyam
> >>>
> >>
> >> Fabrizio,
> >>
> >> Thanks!
> >>
> >> Hans,
> >>
> >> Can you please add Cc: stable@vger.kernel.org when you commit this?
> >
> > Also, please help on the subject-line correction, from
> > amd-pmu to amd-pmc.
>
> Good point, I've added the Cc: stable and also fixed the Subject.
>
> I will also include this patch in my next fixes pull-req for 5.16.
>
> Regards,
>
> Hans
>
