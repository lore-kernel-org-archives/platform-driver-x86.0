From: "Limonciello, Mario" <Mario.Limonciello@dell.com>
Subject: Re: [PATCH] platform/x86:dell-laptop:Add battery charging thresholds
 and charging mode switch.
Date: Wed, 29 Jul 2020 13:14:58 +0000
Message-ID: <DM6PR19MB2636C2298994F284C62924CEFA700@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <20200729065424.12851-1-Perry_Yuan@Dell.com>,<20200729072756.46skroedpbo3fjyn@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200729072756.46skroedpbo3fjyn@srcf.ucam.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, "Yuan, Perry" <Perry.Yuan@dell.com>
Cc: "sre@kernel.org" <sre@kernel.org>, "pali@kernel.org" <pali@kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> The values here seem very Dell specific, but this is going into a =0A=
> generic sysfs path. Really stuff here should be as vendor independent as =
=0A=
> possible. If these values don't correspond to a wider industry =0A=
> specification it probably makes sense to make this something Dell =0A=
> specific.=0A=
=0A=
Worth pointing out that for wilco-ec they use this path:=0A=
Documentation/ABI/testing/sysfs-class-power-wilco=0A=
=0A=
So that could be something good to model off for v2.=
