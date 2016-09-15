From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: Re: Add support for recent lenovo thinkpad HKEYS(Wifi/video swicth
 etc) buttons
Date: Thu, 15 Sep 2016 08:51:34 +0000
Message-ID: <1473929506.3549.153.camel@infinera.com>
References: <1473835500.3549.60.camel@infinera.com>
         <20160914115405.GA22341@kroah.com> <1473854415.3549.94.camel@infinera.com>
         <20160914143510.GB11149@kroah.com> <1473869643.3549.103.camel@infinera.com>
         <20160914170811.GA13294@kroah.com> <1473875861.3549.108.camel@infinera.com>
         <20160914181043.GA16177@kroah.com> <1473880067.3549.124.camel@infinera.com>
         <20160915055944.GB14085@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20160915055944.GB14085@kroah.com>
Content-Language: en-US
Content-ID: <EDDCC6C516513140B9D94D3CC99FC85B@infinera.com>
Sender: stable-owner@vger.kernel.org
To: "greg@kroah.com" <greg@kroah.com>
Cc: "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2016-09-15 at 07:59 +0200, greg@kroah.com wrote:
> On Wed, Sep 14, 2016 at 07:07:36PM +0000, Joakim Tjernlund wrote:
> >=20
> > On Wed, 2016-09-14 at 20:10 +0200, greg@kroah.com wrote:
> > >=20
> > > On Wed, Sep 14, 2016 at 05:57:30PM +0000, Joakim Tjernlund wrote:
> > > >=20
> > > >=20
> > > > On Wed, 2016-09-14 at 19:08 +0200, greg@kroah.com wrote:
> > > > >=20
> > > > >=20
> > > > > On Wed, Sep 14, 2016 at 04:13:52PM +0000, Joakim Tjernlund wrote:
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > On Wed, 2016-09-14 at 16:35 +0200, greg@kroah.com wrote:
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > On Wed, Sep 14, 2016 at 12:00:04PM +0000, Joakim Tjernlund wr=
ote:
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > On Wed, 2016-09-14 at 13:54 +0200, Greg KH wrote:
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > On Wed, Sep 14, 2016 at 06:44:50AM +0000, Joakim Tjernlun=
d wrote:
> > > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > These patches are picked from Linux upstream repo and a=
pplies directly on 4.4.x
> > > > > > > > > > Please excuse the attachments but git send email does n=
ot work for us ATM.
> > > > > > > > >=20
> > > > > > > > > What is the git commit ids of these patches in Linus's tr=
ee?
> > > > > > > > 0002-thinkpad_acpi-Add-support-for-keyboard-backlight.patch=
:
> > > > > > > > 6cf4a2c575b4797b967a575b6274e0e40c5f88f1
> > > > > > >=20
> > > > > > > I do not see that git commit id in Linus's tree, do you?
> > > > > >=20
> > > > > > ehh, no. I used my 4.4 branch instead of linux master, sorry
> > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > 0003-thinkpad_acpi-Remove-ambiguous-logging-for-Unsupport.p=
atch:
> > > > > > > > 85342b97c2ee2a94a31ea5d59d58cdfd1f045e2a
> > > > > > >=20
> > > > > > > Nor this one.=A0=A0I stopped here, assuming that your other i=
ds aren't
> > > > > > > correct either :(
> > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > 0004-thinkpad_acpi-Silence-an-uninitialized-variable-warn.p=
atch:
> > > > > > > > dcf95a1961f9614eee09066f8148813772ad4268
> > > > > > > > 0005-thinkpad_acpi-save-kbdlight-state-on-suspend-and-
> > > > > > > > res.patch:1c6c99c6767035761d17aeecaf0224934ccd00fb
> > > > > > > > 0006-thinkpad_acpi-Add-support-for-HKEY-version-0x200.patch=
:
> > > > > > > > 1bc0df534d11c8c9c97e1e8315b7d22bf034c8d2
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > And what happened to the other patches in this series?
> > > > > > > > > =A0
> > > > > > > > The first one was inappropriate, that is why 0001 is missin=
g.
> > > > > > >=20
> > > > > > > That's pretty strange of you to force us to guess what is goi=
ng on here,
> > > > > > > would you like to get a series like this and wonder why somet=
hing
> > > > > > > obvious like this is gone?
> > > > > >=20
> > > > > > Yes, it was inconsiderate of me, sorry.
> > > > > >=20
> > > > > > Trying to do better I figured I should generate a new series fr=
om Linus tree but
> > > > > > I cannot figure out how generate a series from commits that are=
 non sequential in Linux tree.
> > > > > > git format path does not have a syntax for that from what I can=
 tell, any ideas?
> > > > >=20
> > > > > Why not just send us the git commit ids that you want applied?=A0=
=A0That's
> > > > > all we need.
> > > > > =A0
> > > > Oh, didn't occur to me. Here we go(ltes se fi I got it right this t=
ime :)
> > > >=20
> > > > bb28f3d51ff5e1be541d057708011cc1efe6fae9 -=A0thinkpad_acpi: Add sup=
port for keyboard backlight
> > >=20
> > > How does this commit meet the Documentation/stable_kernel_rules.txt
> > > requirements?=A0=A0It's a new feature, and too big, why would we add =
it to
> > > an old kernel like this one?=A0=A0What's wrong with just using a newe=
r
> > > kernel for a feature like this?
> > >=20
> > > >=20
> > > >=20
> > > > 15c75626f0999cce8357c8bf8578247134032acb -=A0thinkpad_acpi: Remove =
ambiguous logging for "Unsupported
> > > > brightness interface"
> > > > a7718360d91eedbedd58978ec8fff4a67a866f86 - thinkpad_acpi: Silence a=
n uninitialized variable warning
> > > > afcedebc6a094224973534f43b396bbbf33fe44e - thinkpad_acpi: save kbdl=
ight state on suspend and restore
> > > > it on
> > > > resume
> > >=20
> > > Are these 3 fixes for the first one?
> > >=20
> > > >=20
> > > >=20
> > > > 0118c2d3eac0545d4095877e5a015b5dc763b3c2 - thinkpad_acpi: Add suppo=
rt for HKEY version 0x200
> > >=20
> > > Again, another feature :(
> >=20
> > hmm, this was the one I really wanted as then wifi/video switch
> > buttons work on our Lenovo laptops we recently bought to replace old
> > HPs. I did not think this was to regard as a new feature, just a fix
> > to make the same buttons work as on other models, sorry.
>=20
> It's a new feature for that model of laptop, otherwise we would be
> backporting everything all the time :(

Yes, but allowing new HW to work properly in older kernels was an exception=
 or at least so I thought.
If here is a new minor version of the e1000 ethernet device which needs a f=
ew tweaks to
function on older kernels, do you not accept patches for that?

>=20
> >=20
> > The other patches were just there to make sure I didn't run inte
> > conflicts I didn't want to resolve.=A0=A0They all made sense except for
> > maybe the one adding keyboard backlight.=A0
> >=20
> > >=20
> > > And why aren't we cc:ing the maintainers of this subsystem?
> >=20
> > Right, they are now. If you and/or maintainers do feel this is
> > inappropriate for stable I will just carry them my self until the next
> > major stable kernel is released.
>=20
> What is wrong with 4.7-stable kernels?=A0=A0Why are you "stuck" at 4.4?
>=A0

Non LTS kernels are fairly short lived. First you have wait for a few patch=
 levels(say >=3D5) before
one can consider the kernel fairly stable. After that there isn't that many=
 release before it retired
and you have to look for the next stable kernel.=A0

Each time you migrate your kernel config between major releases there is a =
risk something is
mis migrated so one has to spend some time to review/test the kernel.
So I stay on LTS were I can and only systems really needing something newer=
 gets a non LTS kernel.

Note that this our company kernel, used on > 100 boxes and it is not uncomm=
on that something
breaks somewhere after a major kernel upgrade, usually because I missed som=
e kernel config.

=A0 Jocke=
