From: <Mario.Limonciello@dell.com>
Subject: Re: [PATCH v2] platform/x86: intel-hid: Add support for Device
 Specific Methods
Date: Sat, 7 Jul 2018 03:48:54 +0000
Message-ID: <1530935335264.5774@Dell.com>
References: <20180628181906.54910-1-srinivas.pandruvada@linux.intel.com>
 <74ac9bf130074e0a8f86a7904783d091@ausx13mpc120.AMER.DELL.COM>
 <95b3748fcb911c7305bd2bbcfd4e368f044f8b14.camel@linux.intel.com>
 <CAHp75VdX+i_N_GttiL3QZrpivpUeJa0ofGfeJR1FkfuiBWocqA@mail.gmail.com>
 <cc4bc804434a40d9bdd2fa03bbb875aa@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VerxQrPwHTU9PF_q_8xkRm7=cBTPf2tb_5xPEoBQKcL8A@mail.gmail.com>,<20180706235907.GE3041@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180706235907.GE3041@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com
Cc: srinivas.pandruvada@linux.intel.com, alex.hung@canonical.com, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, rjw@rjwysocki.net
List-Id: platform-driver-x86.vger.kernel.org

>I strongly advocate for vendors to have more control over their drivers,=
=0A=
>but this scenario really frustrates me. I don't think I can justify this=
=0A=
>to Linus as a fix. But before we just say "no" (because hey, I want=0A=
>these fixes available as early as possible too), let's ask Rafael if he=0A=
>has an opinion or if there is precedent for this in his experience with=0A=
>ACPI drivers in general:=0A=
=0A=
Full disclosure - an updated FW has since been rolled out that reverted thi=
s=0A=
behavior back to previous FW behavior due to lack of Linux support for the=
=0A=
new _DSM.  There is desire to use the new interface (as it did fix actual=
=0A=
problems with the old one) so at some point it may return.  When that happe=
ns=0A=
it would be ideal that people who are (for example) running an LTS kernel=
=0A=
or distro kernel that tracks stable can pick it up too.=0A=
