From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/3] Dell Airplane Mode Switch driver
Date: Wed, 13 May 2015 11:38:22 -0700
Message-ID: <20150513183822.GA7122@fury.dvhart.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
 <201505031238.14772@pali>
 <CAJ=jquY=QG9j1ppYBbbp5WQTVHVfsUHr8NjX5fuH+4mMWeEkdQ@mail.gmail.com>
 <20150506113119.GH30910@pali>
 <20150506215744.GA22096@fury.dvhart.com>
 <CAJ=jquaA5iZmGTjTCNdaUjYkPpE_XgOHELghcjyHMLPcO+Wc0w@mail.gmail.com>
 <20150513114841.GF2920@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33071 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754809AbbEMSi0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 May 2015 14:38:26 -0400
Content-Disposition: inline
In-Reply-To: <20150513114841.GF2920@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Wed, May 13, 2015 at 01:48:41PM +0200, Pali Roh=C3=A1r wrote:
> Darren, can you review/comment this v2 series? It is OK for 4.2 now?
>=20

I thought I was waiting on an Ack from Alex but reviewing the various t=
hreads I
think he's OK with this.

Running the patches through checkpatch reports various issues about tab=
s
(resolved by using proper multi-line comment formatting), line length, =
and not
wrapping strings. I corrected these locally to move things along, but w=
hen
building:

  CC [M]  drivers/platform/x86/dell-rbtn.o
drivers/platform/x86/dell-rbtn.c: In function =E2=80=98dell_rbtn_notifi=
er_register=E2=80=99:
drivers/platform/x86/dell-rbtn.c:273:2: warning: ignoring return value =
of =E2=80=98driver_for_each_device=E2=80=99, declared with attribute wa=
rn_unused_result [-Wunused-result]
  driver_for_each_device(&rbtn_driver.drv, NULL, &ret, rbtn_inc_count);
  ^
drivers/platform/x86/dell-rbtn.c:284:3: warning: ignoring return value =
of =E2=80=98driver_for_each_device=E2=80=99, declared with attribute wa=
rn_unused_result [-Wunused-result]
   driver_for_each_device(&rbtn_driver.drv, NULL, (void *)false,
   ^
drivers/platform/x86/dell-rbtn.c: In function =E2=80=98dell_rbtn_notifi=
er_unregister=E2=80=99:
drivers/platform/x86/dell-rbtn.c:300:3: warning: ignoring return value =
of =E2=80=98driver_for_each_device=E2=80=99, declared with attribute wa=
rn_unused_result [-Wunused-result]
   driver_for_each_device(&rbtn_driver.drv, NULL, (void *)true,

We can't introduce new warnings to the build.

I've pushed my fixes to the series to my dell-rbtn branch, please start=
 from
there and resolve the above, and resubmit. We can still make 4.2. But p=
lease
make use of checkpatch and watch for warnings like the above in your bu=
ilds
tests so we can avoid unecessary churn.

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
