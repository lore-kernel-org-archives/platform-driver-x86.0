From: Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Subject: Re: platform/x86: asus-wmi: SW_TABLET_MODE is always 1 on some
 devices
Date: Fri, 11 Sep 2020 00:31:29 +0200
Message-ID: <20200910223129.epmeyvodj6agnzav@fastboi.localdomain>
References: <20200901215536.qcouepovmfxje4n5@fastboi.localdomain>
 <0f7302c9-b508-a078-8c62-5ad5a03d92c2@redhat.com>
 <20200902125220.25x52dl2vupejg5f@fastboi.localdomain>
 <20200904094546.jes44d2kn5mtn2zu@fastboi.localdomain>
 <320c0b71-af94-c673-21c8-c32a0fdb4d4e@redhat.com>
 <20200904171743.ejew22p3zzada55p@fastboi.localdomain>
 <a21a6fbf-f38b-3531-07f4-74edd0e42eb6@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a21a6fbf-f38b-3531-07f4-74edd0e42eb6@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hello!

On 10.09.2020 19:44, Hans de Goede wrote:
> Hi,
> 
> On 9/4/20 7:17 PM, Samuel Čavoj wrote:
> > Hi,
> > 
> > On 04.09.2020 12:06, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 9/4/20 11:45 AM, Samuel Čavoj wrote:
> > > > Hello!
> > > > 
> > > > On 02.09.2020 14:52, Samuel Čavoj wrote:
> > > > > Hello,
> > > > > 
> > > > > On 02.09.2020 13:52, Hans de Goede wrote:
> > > > > > But I would rather try to figure out a better way. Can you
> > > > > > create an acpidump, by as root running:
> > > > > > 
> > > > > > acpidump -o acpidump.asus-UX360CA
> > > > > 
> > > > > The file is attached gzipped.
> > > > > 
> > > > > > 
> > > > > > And then send me a direct (so without including the list)
> > > > > > email with the generated acpidump.asus-UX360CA file attached please?
> > > > > > 
> > > > > > Also, if necessary are you capable of building your own
> > > > > > kernel with a (test)patch applied ?
> > > > > 
> > > > > Yes, that is no problem at all.
> > > > > Thank you for your quick response.
> > > > > 
> > > > > Regards,
> > > > > Samuel
> > > > 
> > > > I don't mean to waste your time, it's just that my trust in mail systems
> > > > has been steadily decreasing. I would just like to make sure you have
> > > > received my previous email with the acpidump.
> > > > 
> > > > In case not, here[1] it is available over https, if the message got
> > > > dropped because of the attachment.
> > > 
> > > I got your mail, but I've been burried under a ton of work,
> > > so it may take a couple of days at least before I can take
> > > a closer look at this.
> > 
> > That's quite alright.
> > 
> > I decided I would try and see if I can be of any use, so I looked around
> > in the WMI implementation in the DSDT and found the following in the
> > DSTS method:
> > 
> > [...]
> > 37486     If ((IIA0 == 0x00120063))
> > 37487     {
> > 37488         Local0 = ^^PCI0.LPCB.EC0.DKPS ()
> > 37489         If ((Local0 == One))
> > 37490         {
> > 37491             Return (0x00010001)
> > 37492         }
> > 37493         Else
> > 37494         {
> > 37495             Return (0x00010000)
> > 37496         }
> > 37497     }
> > [...]
> > 
> > This is the If statement responsible for the ASUS_WMI_DEVID_KBD_DOCK
> > device, and it always seems to return 0x00010000 on my machine. I
> > followed it up the call chain but in the end it just read some bit from
> > some register of the EC.
> > 
> > Then I noticed the If statement right above it, which corresponds to
> > dev_id 0x00060062:
> > 
> > [...]
> > 37472     If ((IIA0 == 0x00060062))
> > 37473     {
> > 37474         If (^^PCI0.LPCB.EC0.RPIN (0x15))
> > 37475         {
> > 37476             Local0 = 0x00010001
> > 37477         }
> > 37478         Else
> > 37479         {
> > 37480             Local0 = 0x00010000
> > 37481         }
> > 37482
> > 37483         Return (Local0)
> > 37484     }
> > [...]
> > 
> > By a stroke of luck, it turns out it's the correct one! I patched the
> > driver to query the state on every event and print it out, and it is
> > exactly what we are looking for.
> > 
> > The state is 0 if the device is in normal, laptop state and changes to 1
> > if flipped over 180 degrees. I patched the module so that the
> > SW_TABLET_MODE switch was set according to it, and everything seems to
> > be behaving as it should.
> 
> Good work on figuring this out!

I'm glad to have learned something new. ACPI was mostly a magic black
box for me up to now.

> 
> > This is, of course, not a full solution, as we
> > still somehow need to decide whether to use the KDB_DOCK device or this
> > one. I don't know what to do about that. Ideally find some flag in the
> > ACPI which says which one we should use?
> > 
> > The event code which is fired when the lid switch state changes, as we
> > already know from the sparse keymap[1], is 0xfa. When the laptop is
> > suspended in laptop mode, flipped to tablet mode in its sleep and
> > awoken, the event is fired. It is, however, not fired when doing it the
> > other way around, so we should probably check the state on resume as
> > well.
> 
> Ok, I've written a patch to try and use the 0x00060062 WMI object/devid
> first and only if that is not there use the 0x00120063 one which the
> Bay Trail and Cherry Trail devices use.

Yeah, that's the solution I had in mind as well and should hopefully be
fine. Until ASUS ships a device with yet another weird firmware quirk,
anyway.

> 
> I've attached the patch, please give it a try.

I've tested the patch on the laptop applied on top of 5.8.8 and it works
as it should!

The patch itself looks good to me, but I have one tiny nitpick: A typo
in my name on line 15. I feel bad for even mentioning that though.

I'm glad we are able to resolve the issue so quickly. I was going to say
that the report on bugzilla should be addressed also, but I see you have
already done that. Thank you for kindly your work.

Regards,
Samuel
