From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 12/14] platform/x86: dell-wmi-smbios: introduce
 character device for userspace
Date: Tue, 26 Sep 2017 22:04:17 +0300
Message-ID: <CAHp75Vc9gKeBP2-hcN2xX58R_RbKtciW-9aKESUs6Xwk2e2b-Q@mail.gmail.com>
References: <cover.1506451187.git.mario.limonciello@dell.com> <dcc096b40d4a7084be54942270984159d09abe1e.1506451187.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dcc096b40d4a7084be54942270984159d09abe1e.1506451187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 26, 2017 at 9:50 PM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> This userspace character device will be used to perform SMBIOS calls
> from any applications.
>
> It contains 3 operating IOCTL's
> 1) sending a properly formatted 4k calling interface buffer.
> 2) Querying number of tokens in the given system
> 3) Copying the status of all these tokens to a properly formatted
>    userspace buffer.
>
> This character device is intended to deprecate the dcdbas kernel module
> and the interface that it provides to userspace.
>
> It's important for the driver to provide a R/W ioctl to ensure that
> two competing userspace processes don't race to provide or read each
> others data.
>
> The character device will only be created if the WMI interface was
> found.
>
> The API for interacting with this interface is defined in documentation
> as well as a uapi header provides the format of the structures.


> +               <uapi/linux/dell-wmi-smbios.h>
> \ No newline at end of file

Oh l=C3=A0 l=C3=A0

--=20
With Best Regards,
Andy Shevchenko
