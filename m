From: ayman.bagabas@gmail.com
Subject: Re: [PATCH v2 0/8] platform/x86: Huawei WMI laptop extras driver
Date: Sun, 30 Jun 2019 13:49:38 -0400
Message-ID: <1424c4198a6a8ba58951eaf4e075d9f17c8609b8.camel@gmail.com>
References: <20190613030416.25807-1-ayman.bagabas@gmail.com>
         <CAHp75Vd2oLkjYjh6k8a3fitAHDvQeu9zm2LpHM7fCXUWN9zaVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vd2oLkjYjh6k8a3fitAHDvQeu9zm2LpHM7fCXUWN9zaVQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 2019-06-29 at 17:27 +0300, Andy Shevchenko wrote:
> On Thu, Jun 13, 2019 at 6:04 AM Ayman Bagabas <
> ayman.bagabas@gmail.com> wrote:
> > Changes from v1:
> > * introducing debugfs
> > * code reformatting
> > 
> > This patch series introduce new features to the driver and also
> > moves the
> > driver from wmi_driver to platform_driver. This move is necessary
> > because the
> > driver is no longer only a hotkeys driver and platform_driver
> > offers easier
> > future extensibility.
> > 
> > The patch series introduces a WMI BIOS interface that brings on new
> > features
> > and enables controlling micmute LED through this interface on
> > supported models.
> > It also enables controlling battery charging thresholds and fn-lock 
> > state.
> > These features are controlled through the HWMI WMI device present
> > in most of
> > these laptops.
> > 
> > Currently, micmute LED is controlled through an ACPI method under
> > EC.
> > This method ("SPIN", "WPIN") is specific to some models and
> > wouldn't
> > work on all Huawei laptops. Controlling this LED through the
> > interface provides
> > a better unified method to control the LED on models that
> > implements this
> > feature.
> > 
> > The behavior of hotkeys is not the same among all models. Some
> > models
> > require fn-lock to do things like `Ctrl-Ins` or `Alt-PrtSc`. Fn-
> > lock inverts the
> > behavior of the top row from special keys to F1-F12 keys.
> > 
> > A debugfs interface is also implemented to support unrepresented
> > features and to
> > provide debugging feedback from users.
> 
> You have sent few series regarding Huawei devices.
> And from the patch 1 this is not applicable.
> So, I dropped all your patches from patchwork queue and will wait for
> new versions in order they are applicable.

I've sent a newer version and rewrote commit messages and cover page.
I've also changed the tag to RFC.

Thank you,
Ayman

> 
> > Ayman Bagabas (8):
> >   platform/x86: huawei-wmi: move to platform driver
> >   platform/x86: huawei-wmi: implement WMI management interface
> >   platform/x86: huawei-wmi: use quirks and module parameters
> >   platform/x86: huawei-wmi: control micmute LED through WMI
> > interface
> >   platform/x86: huawei-wmi: add battery charging protection support
> >   platform/x86: huawei-wmi: add fn-lock support
> >   platform/x86: huawei-wmi: add sysfs interface support
> >   platform/x86: huawei-wmi: add debugfs files support
> > 
> >  drivers/platform/x86/huawei-wmi.c | 754
> > ++++++++++++++++++++++++++----
> >  1 file changed, 665 insertions(+), 89 deletions(-)
> > 
> > --
> > 2.20.1
> > 
> 
> 
