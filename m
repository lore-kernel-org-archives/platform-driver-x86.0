Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B371C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 07:17:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236096AbiBQHRy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 02:17:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbiBQHRx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 02:17:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC69DC7E5B
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 23:17:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48473B82127
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 07:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E03C340E8
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 07:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645082254;
        bh=B/xpGCZTo/TOIVskhY+Zpylv54bekr8tMldO5Ta4l+E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ejo3z5A+4bEoT3JIl8fXk7gchxTeUFLSruc95IFhMzrSU5wUTCqOKokqkfBRIrKaJ
         tzMD31fkmi5qX2o3V0EWEFhotG+UKcpbnek/Lwm4l25ejE9wvoFIrt6FOll2gjIrUx
         YtICEnfhX+Hnk5HZIEqdM5B1LU6XWaNdj3n2WXc998gzcCI+zUOjJIM9fJZPOp4OXM
         NyopPpRc1nl4XHwZ9QhKQrP5ImX58UC6OlaWTIHo2JL68e5BACR2VewRFvO4C3XeLw
         oGSxqSq8kOH2oIwYMAM0+Rgid6UM41KHNtjGqmRNvOlvw6ocELbMZvLXdmhntPsAjh
         E+VSihvng7POg==
Received: by mail-yb1-f172.google.com with SMTP id 124so11080186ybn.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 23:17:34 -0800 (PST)
X-Gm-Message-State: AOAM530rJnDx0YkP+BkFNu2Ipe5fSQH9mOhC8ObAmPMV9zusOI2K+yZp
        qK6kgnB5MMWQ4iaB1kW2rTDQ6OY1VGVjq2aTWrg=
X-Google-Smtp-Source: ABdhPJyYCoiyZk3HQd5p5RXoCRMrd/9+YLgAa5eVic2FXQi2gRvasbrTbmmvzL3WkAVC6JTtYaQY5T8acjXwvEb5Zt4=
X-Received: by 2002:a05:6902:1282:b0:61a:7abd:6785 with SMTP id
 i2-20020a056902128200b0061a7abd6785mr1364071ybu.558.1645082253813; Wed, 16
 Feb 2022 23:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20220216133336.108810-1-nchatrad@amd.com> <CAPhsuW7gbYinzABHiDri5xpiHPrNh2tbPz8X+kTo9qWZbjGzmQ@mail.gmail.com>
 <a130d618-c4c4-4a05-2401-74058275a8bb@amd.com> <26c020dd-bb27-a7ce-78d8-407f42e06282@amd.com>
In-Reply-To: <26c020dd-bb27-a7ce-78d8-407f42e06282@amd.com>
From:   Song Liu <song@kernel.org>
Date:   Wed, 16 Feb 2022 23:17:22 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4O_YptMGAMA5RK76Yoibp4M4GsXx09a7ccvBDLM=58DQ@mail.gmail.com>
Message-ID: <CAPhsuW4O_YptMGAMA5RK76Yoibp4M4GsXx09a7ccvBDLM=58DQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] platforms/x86: Add AMD system management interface
To:     "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
Cc:     Carlos Bilbao <carlos.bilbao@amd.com>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, siva.sathappan@amd.com,
        nathan.fontenot@amd.com, Suma Hegde <suma.hegde@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Feb 16, 2022 at 10:25 PM Chatradhi, Naveen Krishna
<nchatrad@amd.com> wrote:
>
> Hi Song, Carlos
>
> On 2/17/2022 3:54 AM, Carlos Bilbao wrote:
> > Hello,
> >
> > On 2/16/2022 4:06 PM, Song Liu wrote:
> >> On Wed, Feb 16, 2022 at 5:34 AM Naveen Krishna Chatradhi
> >> <nchatrad@amd.com> wrote:
> >>> From: Suma Hegde <suma.hegde@amd.com>
> >>>
> >>> Recent Fam19h EPYC server line of processors from AMD support system
> >>> management functionality via HSMP (Host System Management Port) inter=
face.
> >>>
> >>> The Host System Management Port (HSMP) is an interface to provide
> >>> OS-level software with access to system management functions via a
> >>> set of mailbox registers.
> >>>
> >>> More details on the interface can be found in chapter
> >>> "7 Host System Management Port (HSMP)" of the following PPR
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F55898_B1_pub_0.50.zip&amp;data=3D0=
4%7C01%7Ccarlos.bilbao%40amd.com%7Cb33402053aa6443bf4f308d9f198a7fe%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637806460908911848%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000&amp;sdata=3DF%2BQgWoHlueI1CW14pJHhY4%2FwM5rOTOj0D3IO%2B7yhrbQ%3D&amp;r=
eserved=3D0
> >>>
> >>> This patch adds new amd_hsmp module under the drivers/platforms/x86/
> >>> which creates miscdevice with an IOCTL interface to the user space.
> >>> /dev/hsmp is for running the hsmp mailbox commands.
> >>>
> >>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> >>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> >>> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
> >> Acked-by: Song Liu <song@kernel.org>
> >>
> >> With a couple minor comments below.
> >>
> >>> ---
> >> [...]
> >>
> >>> +
> >>> +struct hsmp_message {
> >>> +       __u32   msg_id;                 /* Message ID */
> >>> +       __u16   num_args;               /* Number of input argument w=
ords in message */
> >>> +       __u16   response_sz;            /* Number of expected output/=
response words */
> >>> +       __u32   buf[HSMP_MAX_MSG_LEN];  /* argument/response buffer *=
/
> >> How about we call these args instead of buf?
>
> Now that we are using this member for both input arguments and output
> response, I've changed it to a
>
> generic name, no problem will change it back to args.
>
> >>
> >> [...]
> >>
> >>> +
> >>> +static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned l=
ong arg)
> >>> +{
> >>> +       int __user *arguser =3D (int  __user *)arg;
> >>> +       struct hsmp_message msg =3D { 0 };
> >>> +       int ret;
> >>> +
> >>> +       if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(=
struct hsmp_message)))
> >>> +               return -EFAULT;
> >>> +
> >>> +       ret =3D validate_message(&msg);
> >> We call validate_message() twice in this path. This is not a big issue=
, but it
> >> will be nice if we can avoid the extra check.
> > Yes, we can probably just rely on hsmp_send_message. We shouldn't remov=
e it
> > from there since we export that function.
>
> We are using msg_id to reference elements from the table. so, i will
> validate the msg.msg_id
>
> is with in the array bounds of hsmp_msg_desc_table[] here.

Yeah, let's keep both checks for now.

Song
