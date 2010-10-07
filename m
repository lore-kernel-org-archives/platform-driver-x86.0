From: Mario Limonciello <superm1@ubuntu.com>
Subject: Re: [PATCH] dell-laptop: Add hwswitch_only module parameter
Date: Thu, 7 Oct 2010 15:49:05 -0500
Message-ID: <AANLkTi=kTQpTkCF6-DE+LdNLH_aki9bD9NPF0L2qRr=Q@mail.gmail.com>
References: <1286422207-14248-1-git-send-email-keng-yu.lin@canonical.com>
	<20101007111510.GA19624@srcf.ucam.org>
	<AANLkTinus8SxbXt14qabXgpbFXF4U+uNoKA-=eDuOjmp@mail.gmail.com>
	<20101007133529.GA21782@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:63602 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753504Ab0JGUtH convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Oct 2010 16:49:07 -0400
In-Reply-To: <20101007133529.GA21782@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Keng-Yu Lin <keng-yu.lin@canonical.com>, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Matthew:

On Thu, Oct 7, 2010 at 08:35, Matthew Garrett <mjg59@srcf.ucam.org> wro=
te:
>
> On Thu, Oct 07, 2010 at 08:30:57AM -0500, Mario Limonciello wrote:
>
> > =A0 =A0In this specific scenario that Ken Yu submitted this patch f=
or, the
> > =A0 =A0firmware will return the same return codes for the SMI's as =
a functional
> > =A0 =A0machine will. =A0Machines affected by this will fail to reco=
ver after rfkill
> > =A0 =A0is toggled twice. =A0The symptom will be that the soft block=
 always appears
> > =A0 =A0set to the same setting with continued keypresses.
> > =A0 =A0During the prototype phase this option is quite useful to he=
lp debug the
> > =A0 =A0problem it addresses.
>
> Is the kernel able to unblock it under those circumstances?

Manually running rfkill unblock will unblock it in this broken
firmware scenario in question.

--
Mario Limonciello
superm1@gmail.com
