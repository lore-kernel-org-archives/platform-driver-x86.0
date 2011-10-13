From: =?UTF-8?B?S2VuZy1Zw7wgTGlu?= <kengyu@canonical.com>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad-acpi: disable alsa volume mixer
 for SL410/SL510
Date: Thu, 13 Oct 2011 15:07:56 +0800
Message-ID: <CADXHx7YFJYvd6K0Djqabxs6kyPJU5YjEGTBTvrMVmFdLirF5rA@mail.gmail.com>
References: <1300181106-20219-1-git-send-email-keng-yu.lin@canonical.com>
 <20110316185755.GC7918@khazad-dum.debian.net> <CADXHx7b36g1+vo9cjuiq7VnjN3LWiwQtgepHjGU1P74ZsdtwQw@mail.gmail.com>
 <20111006181220.GA15950@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111006181220.GA15950@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Oct 7, 2011 at 2:12 AM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Thu, 06 Oct 2011, Keng-Y=C3=BC Lin wrote:
>> On Thu, Mar 17, 2011 at 2:57 AM, Henrique de Moraes Holschuh
>> <hmh@hmh.eng.br> wrote:
>> > On Tue, 15 Mar 2011, Keng-Yu Lin wrote:
>> >> The mute key on SL410/SL510 only works when the alsa volume mixer
>> >> is not enabled. This patch makes the alsa volume mixer disabled
>> >> on the matched SL410/SL510 EC versions.
>> >
>> > I'd like more data on this. =C2=A0Is this some sort of weird inter=
action with
>> > userspace, or does the firmware actually changes behaviour when we
>> > enable the MUTE HKEY event in the event mask?
>>
>> The firmware does not change its behaviour with the key enabled in t=
he keymask.
>> The mute key (and the LED on it) of the two models works good withou=
t
>> thinkpad_acpi loaded. So in the patch I like to exclude the volume
>> control part for the two models.
>
> If the firmware does not change behaviour, doesn't that mean the bug =
is
> elsewhere?
>
> Is the firmware reporting these keys somewhere else (e.g. through the
> keyboard)?
>

As the users reported in https://launchpad.net/bugs/595896, there is
no KEY_MUTE either from thinkpad_acpi nor the keyboard when pressing
the mute hotkey. (I do not really possess the hardware. but just
debugged/helped remotely).

It will be really appreciated if there is any suggestion/insight for
looking into the bug.  At the moment I can just find this fix for the
issue.
