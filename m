From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH 1/1 v2] classmate-laptop: Add support for Classmate V4
 accelerometer.
Date: Mon, 23 Jul 2012 14:28:41 +0100
Message-ID: <20120723132841.GD21495@srcf.ucam.org>
References: <cover.1340976795.git.magomez@igalia.com>
 <39ac42c709e498fbef4f0f0f24edc5331e5f4473.1340976795.git.magomez@igalia.com>
 <20120717224749.GA20813@nautilus.holoscopio.com>
 <5006BFEC.1010407@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5006BFEC.1010407@igalia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel =?iso-8859-1?Q?G=F3mez?= <magomez@igalia.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, don@syst.com.br, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 18, 2012 at 03:53:48PM +0200, Miguel G=F3mez wrote:

> >1) reverting the patch in acpica that puts all names in uppercase
> >2) using a case-insensitive match in acpi bus driver
> >3) using uppercase name in classmate-laptop driver
>=20
> I think the easiest and less risky way to fix this is by adding a
> new hardware id (as proposed in the thread's patch), as it doesn't
> add any side effects (that the other solutions might add), and it
> doesn't break the behaviour of the old code.

I've lost track of the implementation state here - if all names are=20
upper-cased in acpica, why is this not already matching?

--=20
Matthew Garrett | mjg59@srcf.ucam.org
