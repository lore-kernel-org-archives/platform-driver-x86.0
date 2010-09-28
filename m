From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v4] dell-laptop: Add debugfs support
Date: Tue, 28 Sep 2010 03:52:02 +0100
Message-ID: <20100928025202.GA17740@srcf.ucam.org>
References: <1284702459-31646-1-git-send-email-keng-yu.lin@canonical.com> <1285325323-4528-1-git-send-email-keng-yu.lin@canonical.com> <20100927140028.GB856@srcf.ucam.org> <AANLkTi=buauo9M=nLnZhEXm-do=Vt1mPwhq3oPFH9fQ_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:49348 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757964Ab0I1CwK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Sep 2010 22:52:10 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTi=buauo9M=nLnZhEXm-do=Vt1mPwhq3oPFH9fQ_@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Keng-Y=FC?= Lin <keng-yu.lin@canonical.com>
Cc: len.brown@intel.com, alan-jenkins@tuffmail.co.uk, superm1@ubuntu.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 28, 2010 at 10:43:44AM +0800, Keng-Y=FC Lin wrote:
> On Mon, Sep 27, 2010 at 10:00 PM, Matthew Garrett <mjg59@srcf.ucam.or=
g> wrote:
> > What's the difference between this version and v3?
> >
> > --
> > Matthew Garrett | mjg59@srcf.ucam.org
> >
>=20
> Hi Mathew:
>   V3 does not print the correct bit of hwswitch_state. I just found
> that V4 messed up by the operator precedence; will send a new fix.

Ok, no problem. In future it's helpful to include a changelog with the=20
difference - see Documentation/SubmittingPatches section 15 for some=20
information on that. I'll wait for v5 and then merge it.

--=20
Matthew Garrett | mjg59@srcf.ucam.org
