From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v10 13/15] platform/x86: wmi: create userspace      interface
 for drivers
Date: Fri, 20 Oct 2017 15:31:12 +0000
Message-ID: <67a7b88891674cb7ac94b46833b6b564@ausx13mpc120.AMER.DELL.COM>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com>
 <20171020132138.GA23973@kroah.com>
 <19e30ca305e449de86b702ae8900d306@ausx13mpc120.AMER.DELL.COM>
 <20171020144839.GA4550@lst.de>
 <c9ceac21e74b4b37b8393ab76bb2238f@ausx13mpc120.AMER.DELL.COM>
 <20171020150850.GA4770@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:3743 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751857AbdJTPb0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Oct 2017 11:31:26 -0400
In-Reply-To: <20171020150850.GA4770@lst.de>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: hch@lst.de
Cc: greg@kroah.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, gnomes@lxorguk.ukuu.org.uk

> -----Original Message-----
> From: Christoph Hellwig [mailto:hch@lst.de]
> Sent: Friday, October 20, 2017 10:09 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: hch@lst.de; greg@kroah.com; dvhart@infradead.org;
> andy.shevchenko@gmail.com; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; luto@kernel.org; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com;
> gnomes@lxorguk.ukuu.org.uk
> Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace interf=
ace for
> drivers
>=20
> On Fri, Oct 20, 2017 at 03:07:27PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > No drivers do this today, it's obviously not a good idea.
> > I was just saying it's hypothetical.
>=20
> If there is no one using the exported methods don't export them.

This particular one is used by patch 14/15 in this series.
