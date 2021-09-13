Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D888C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 12:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8138060F6C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 12:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236331AbhIMMlK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 08:41:10 -0400
Received: from mail-4316.protonmail.ch ([185.70.43.16]:64703 "EHLO
        mail-4316.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236160AbhIMMlJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 08:41:09 -0400
X-Greylist: delayed 9014 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Sep 2021 08:41:09 EDT
Date:   Mon, 13 Sep 2021 12:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1631536792;
        bh=YgDJ919x6p+xEDKzh2hqJMeh22fKtn9ZZCwv+qc/q9E=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=p+EFs132V6qLMWiZVHMRs5vNgLJYloI6X+Jpa3owbIFOeCZT+unJnnUreH2+sSY5G
         qZcU46TumdYOtFT0KkmO4aqFiVZ1av0MZZGUWpgAAL2Y5aU2VlNyUbWvA9gkiuUzHM
         h32yXc2vH+0Nat3j6tBnskxV7myffh58l5JYzyoA=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v1] platform/x86: wmi: initialize method name directly
Message-ID: <hzBz08bOjTWZu618gVKAzEKaxvFF0ng70vA3ddZ9f8sr9_zrK7yZpTgPZ7mzHOVxO6Mj8YCp6E_uMlXIeHRYqE5xrLDKYTcVLG8qwsJZBO0=@protonmail.com>
In-Reply-To: <f8c3b70a-74ec-15e9-4ee1-dae35e4c803b@redhat.com>
References: <20210913110805.12387-1-pobrn@protonmail.com> <14e14dd2-a51e-87ae-5776-5f0a585e4936@redhat.com> <iEeEte3wo5BG2NCmh5maeSDY6lUKyxcNdSTRMDXkKsClHCr1LkfBFv0OLwpuIr6EHnl2_6QvRmTy9XTAtgTT5vpLWYe1dy6GisNb7-1UjUw=@protonmail.com> <f8c3b70a-74ec-15e9-4ee1-dae35e4c803b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. szeptember 13., h=C3=A9tf=C5=91 14:20 keltez=C3=A9ssel, Hans de Goede=
 =C3=ADrta:
> Hi,
>
> On 9/13/21 2:15 PM, Barnab=C3=A1s P=C5=91cze wrote:
> > Hi
> >
> >
> > 2021. szeptember 13., h=C3=A9tf=C5=91 13:53 keltez=C3=A9ssel, Hans de G=
oede =C3=ADrta:
> >> In "platform/x86: wmi: introduce helper to generate method names"
> >> you added a get_acpi_method_name() helper for generating WMI
> >> method-names and you are using that everywhere else.
> >>
> >> IMHO it would be better to also use that here. Is there any
> >> specific reason why you are not using this here ?
> >
> > Yes, indeed, but `get_acpi_method_name()` uses the `object_id` of the G=
UID block,
> > this one uses the `notify_id`. And it seemed problematic to find a simp=
le
> > way to reconcile the differences, so I haven't really given it much tho=
ught.
> > I'm open to suggestions.
>
> Ah I see, TBH I liked your original patch just adding sizeof() better
> then the new one. Or maybe replace the 2 "5"-s used in the snprintf
> version with WMI_ACPI_METHOD_NAME_SIZE ?
> [...]

I will not resend it, but please feel free to apply the older patch if thin=
k it is better.
Personally, I don't like it, but oh well...


Best regards,
Barnab=C3=A1s P=C5=91cze
