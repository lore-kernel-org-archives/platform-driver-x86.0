Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D81C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FF162223D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 05:53:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728993AbhAZFxZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:53:25 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:19279 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729361AbhAYOSq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 09:18:46 -0500
Date:   Mon, 25 Jan 2021 14:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1611584283;
        bh=7nNdB63QdRQMdbIHYe4I50+Lx1RuLumtEacZpIkAsAk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=kiuq9Jx71x+Hg0ZjMSOCuUoNmjVxKL2szPnL0VrmLII/aAyN/f6YfxzefNmfqJNRZ
         i6doCJkvrOoGIHf+e9+6lUhuVfZWze5mMMjb1lRcaZE/Wrck9Zz+7eSBGD5qFlKtoO
         X2QrE3ODLMtkwy0/N1iFT5kBxT2JbJazoWbaQZ6E=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 09/24] platform/x86: ideapad-laptop: always propagate error codes from device attributes' show() callback
Message-ID: <d8cwgdfa3LVr-6vePbV5MwgwG97MlzUiNdO1LPomugtHi0GO83FPCbDMbj9hef1w5f9XbDR919K7R4JOvz5o9WMurdoRz6Y8KcSRXRwGtTY=@protonmail.com>
In-Reply-To: <cbee040a-53c8-b58f-3231-58d774bbda0a@redhat.com>
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-10-pobrn@protonmail.com> <CAHp75VfJBvG6ma0UxOjb4Wudeqpf9qrE3AtQ+nwwtsGhZ6fRpQ@mail.gmail.com> <b99c4482-faea-ff72-4367-8aeca7250040@canonical.com> <CAHp75Ve0hpfX6GPEH+ehCb-FsKomMwKRzkkD7Oup4utXSAidAA@mail.gmail.com> <8f9c5892-afad-7066-3a12-1c96c16dba8d@redhat.com> <CAHp75VdmwxZeqY3qdO6AuK3QTF=p+Wn9qByMsLEzaV4VV78QHQ@mail.gmail.com> <cbee040a-53c8-b58f-3231-58d774bbda0a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

2021. janu=C3=A1r 25., h=C3=A9tf=C5=91 12:40 keltez=C3=A9ssel, Hans de Goed=
e =C3=ADrta:

> Hi,
>
> On 1/25/21 12:35 PM, Andy Shevchenko wrote:
> > On Mon, Jan 25, 2021 at 1:26 PM Hans de Goede <hdegoede@redhat.com> wro=
te:
> >> On 1/25/21 11:57 AM, Andy Shevchenko wrote:
> >>> On Mon, Jan 25, 2021 at 9:37 AM Ike Panhc <ike.pan@canonical.com> wro=
te:
> >>>>
> >>>> On 1/17/21 3:49 AM, Andy Shevchenko wrote:
> >>>>> On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze <pobrn@pro=
tonmail.com> wrote:
> >>>>>>
> >>>>>> Consumers can differentiate an error from a successful read much m=
ore
> >>>>>> easily if the read() call fails with the appropriate errno instead=
 of
> >>>>>> returning a magic string like "-1".
> >>>>>
> >>>>> Is user space ready for this (for the record, it seems an ABI break=
age)?
> >>>>>
> >>>>
> >>>> read() and getting errno looks sysfs/driver broken to me. I think
> >>>> if button/method is not available, it's better to be something like
> >>>> sysfs_emit(buf, "%d\n", -ENODEV)
> >>>
> >>> Either way it will be an ABI breakage.
> >>
> >> True any change here will be an ABI breakage, but I really do not expe=
ct
> >> anything to be dependent on this weird behavior of returning errors by
> >> writing some magic value to the buffer, rather then just error-ing out
> >> of the read() call.
> >>
> >> The kernel-convention here clearly is to make the read() syscall fail =
with
> >> -ESOMETHING on errors. So I see this as making the driver conform to t=
he
> >> expected sysfs API behavior. Since this change is nicely split out int=
o a
> >> separate patch, we can always revert it if it turns out there actually
> >> is something depending on this. But again I see that as highly
> >> unlikely.
> >
> > Me too. My point is that every stakeholder here understands that.
> > Perhaps elaborated in the commit message.
>
> Ack, adding a note about this to the commit message would be good.
>
> Barnab=C3=A1s, can you add a note about this to the commit message?
>
> Also I think we are about ready for you to post a v3 of this
> series (when you have time to do so).
>

Yes, I can add a note about this. I've been relatively busy for some time,
but I'm planning to submit the new version shortly (by the end of this week=
).
