From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: Re: Add support for recent lenovo thinkpad HKEYS(Wifi/video swicth
 etc) buttons
Date: Wed, 14 Sep 2016 19:07:36 +0000
Message-ID: <1473880067.3549.124.camel@infinera.com>
References: <1473835500.3549.60.camel@infinera.com>
         <20160914115405.GA22341@kroah.com> <1473854415.3549.94.camel@infinera.com>
         <20160914143510.GB11149@kroah.com> <1473869643.3549.103.camel@infinera.com>
         <20160914170811.GA13294@kroah.com> <1473875861.3549.108.camel@infinera.com>
         <20160914181043.GA16177@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20160914181043.GA16177@kroah.com>
Content-Language: en-US
Content-ID: <82A1F6C42EC12F46B74DD22D2C48AD6F@infinera.com>
Sender: stable-owner@vger.kernel.org
To: "greg@kroah.com" <greg@kroah.com>
Cc: "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2016-09-14 at 20:10 +0200, greg@kroah.com wrote:
> On Wed, Sep 14, 2016 at 05:57:30PM +0000, Joakim Tjernlund wrote:
> >=20
> > On Wed, 2016-09-14 at 19:08 +0200, greg@kroah.com wrote:
> > >=20
> > > On Wed, Sep 14, 2016 at 04:13:52PM +0000, Joakim Tjernlund wrote:
> > > >=20
> > > >=20
> > > > On Wed, 2016-09-14 at 16:35 +0200, greg@kroah.com wrote:
> > > > >=20
> > > > >=20
> > > > > On Wed, Sep 14, 2016 at 12:00:04PM +0000, Joakim Tjernlund wrote:
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > On Wed, 2016-09-14 at 13:54 +0200, Greg KH wrote:
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > On Wed, Sep 14, 2016 at 06:44:50AM +0000, Joakim Tjernlund wr=
ote:
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > These patches are picked from Linux upstream repo and appli=
es directly on 4.4.x
> > > > > > > > Please excuse the attachments but git send email does not w=
ork for us ATM.
> > > > > > >=20
> > > > > > > What is the git commit ids of these patches in Linus's tree?
> > > > > > 0002-thinkpad_acpi-Add-support-for-keyboard-backlight.patch:
> > > > > > 6cf4a2c575b4797b967a575b6274e0e40c5f88f1
> > > > >=20
> > > > > I do not see that git commit id in Linus's tree, do you?
> > > >=20
> > > > ehh, no. I used my 4.4 branch instead of linux master, sorry
> > > >=20
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > 0003-thinkpad_acpi-Remove-ambiguous-logging-for-Unsupport.patch=
:
> > > > > > 85342b97c2ee2a94a31ea5d59d58cdfd1f045e2a
> > > > >=20
> > > > > Nor this one.=A0=A0I stopped here, assuming that your other ids a=
ren't
> > > > > correct either :(
> > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > 0004-thinkpad_acpi-Silence-an-uninitialized-variable-warn.patch=
:
> > > > > > dcf95a1961f9614eee09066f8148813772ad4268
> > > > > > 0005-thinkpad_acpi-save-kbdlight-state-on-suspend-and-
> > > > > > res.patch:1c6c99c6767035761d17aeecaf0224934ccd00fb
> > > > > > 0006-thinkpad_acpi-Add-support-for-HKEY-version-0x200.patch:
> > > > > > 1bc0df534d11c8c9c97e1e8315b7d22bf034c8d2
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > And what happened to the other patches in this series?
> > > > > > > =A0
> > > > > > The first one was inappropriate, that is why 0001 is missing.
> > > > >=20
> > > > > That's pretty strange of you to force us to guess what is going o=
n here,
> > > > > would you like to get a series like this and wonder why something
> > > > > obvious like this is gone?
> > > >=20
> > > > Yes, it was inconsiderate of me, sorry.
> > > >=20
> > > > Trying to do better I figured I should generate a new series from L=
inus tree but
> > > > I cannot figure out how generate a series from commits that are non=
 sequential in Linux tree.
> > > > git format path does not have a syntax for that from what I can tel=
l, any ideas?
> > >=20
> > > Why not just send us the git commit ids that you want applied?=A0=A0T=
hat's
> > > all we need.
> > > =A0
> > Oh, didn't occur to me. Here we go(ltes se fi I got it right this time =
:)
> >=20
> > bb28f3d51ff5e1be541d057708011cc1efe6fae9 -=A0thinkpad_acpi: Add support=
 for keyboard backlight
>=20
> How does this commit meet the Documentation/stable_kernel_rules.txt
> requirements?=A0=A0It's a new feature, and too big, why would we add it t=
o
> an old kernel like this one?=A0=A0What's wrong with just using a newer
> kernel for a feature like this?
>=20
> >=20
> > 15c75626f0999cce8357c8bf8578247134032acb -=A0thinkpad_acpi: Remove ambi=
guous logging for "Unsupported
> > brightness interface"
> > a7718360d91eedbedd58978ec8fff4a67a866f86 - thinkpad_acpi: Silence an un=
initialized variable warning
> > afcedebc6a094224973534f43b396bbbf33fe44e - thinkpad_acpi: save kbdlight=
 state on suspend and restore it on
> > resume
>=20
> Are these 3 fixes for the first one?
>=20
> >=20
> > 0118c2d3eac0545d4095877e5a015b5dc763b3c2 - thinkpad_acpi: Add support f=
or HKEY version 0x200
>=20
> Again, another feature :(

hmm, this was the one I really wanted as then wifi/video switch buttons wor=
k on our Lenovo laptops we
recently bought to replace old HPs. I did not think this was to regard as a=
 new feature, just a fix to
make the same buttons work as on other models, sorry.

The other patches were just there to make sure I didn't run inte conflicts =
I didn't want to resolve.
They all made sense except for maybe the one adding keyboard backlight.=A0

>=20
> And why aren't we cc:ing the maintainers of this subsystem?

Right, they are now. If you and/or maintainers do feel this is inappropriat=
e for stable I will just
carry them my self until the next major stable kernel is released.

=A0Thanks
=A0 =A0 =A0 =A0 =A0 Jocke=A0=
