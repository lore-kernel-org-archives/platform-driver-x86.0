From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Tue, 28 Jun 2011 18:27:45 +0900
Message-ID: <cc703738-d0d7-4a07-8111-50bb7a1e1f24@email.android.com>
References: <4DE8FC4A.9010401@absence.it> <4DE8FE7B.6090602@absence.it> <20110612222123.GB31095@kamineko.org> <4DF55356.9020405@absence.it> <4DFD2F83.40803@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:50186 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756776Ab1F1J2N (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2011 05:28:13 -0400
Received: by pzk9 with SMTP id 9so3748pzk.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jun 2011 02:28:13 -0700 (PDT)
In-Reply-To: <4DFD2F83.40803@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org



Marco Chiappero <marco@absence.it> wrote:

>Il 13/06/2011 02:01, Marco Chiappero ha scritto:
>> Il 13/06/2011 00:21, Mattia Dongili ha scritto:
>>>> +static int sony_nc_snc_setup(struct platform_device *pd)
>>>
>>> To be honest these sony_nc_snc_* functions are a bit poorly named.
>>> sony_nc_ was already supposed to be a partial expansion of SNC so
>this
>>> whole thing is a bit redundant now. what about
>>> sony_nc_setup/sony_nc_cleanup?
>>
>> Yes I know but in the hurry I forgot to think about that, I will use
>> this new naming schema.
>
>I've been rethinking about this, I was rather unhappy with the=20
>sony_nc_snc_setup_handles and sony_nc_handles_setup names. I think tha=
t
>
>the best solution is:
>- to rename sony_nc_handles_setup to sony_nc_handles_list_setup

This:
>- to include the sony_nc_setup_handles code back to sony_nc_snc_setup=20

should be enough to disambiguate without gratuitously renaming all the =
other functions.

Again =E1=BB=8B can only access my mail via a mobile phone for now so I=
 hope I remember correctly what the whole discussion was about.

>and to rename this last one sony_nc_handles_setup, that should now dea=
l
>
>with the sole handles (and handles events) setup. The same goes for th=
e
>
>sony_nc_snc_resume and sony_nc_snc_cleanup functions.

--=20
Mattia
