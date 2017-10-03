From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v3 4/8] platform/x86: wmi: create character devices when requested by drivers
Date: Tue, 3 Oct 2017 12:31:28 -0700
Message-ID: <5B7882F5-B235-4225-A782-A412107A78F3@amacapital.net>
References: <cover.1506571187.git.mario.limonciello@dell.com> <17fcf9748e83ede2751a00d8248cb32cbdc610d6.1506571188.git.mario.limonciello@dell.com> <20171003092323.GA13295@kroah.com> <20171003151039.GA14523@fury> <CALCETrU2V9bZdCR6t2-TTHVmSGos_McFVeJ4gb_4m3VjUM6-cg@mail.gmail.com> <c6a8dca71d794768a9e071806d53940b@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c6a8dca71d794768a9e071806d53940b@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: luto@kernel.org, dvhart@infradead.org, greg@kroah.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

I think David Hermann had some review comments.

--Andy

On Oct 3, 2017, at 11:38 AM, <Mario.Limonciello@dell.com> <Mario.Limonciello=
@dell.com> wrote:

>> -----Original Message-----
>> From: Andy Lutomirski [mailto:luto@kernel.org]
>> Sent: Tuesday, October 3, 2017 11:48 AM
>> To: Darren Hart <dvhart@infradead.org>
>> Cc: Greg KH <greg@kroah.com>; Limonciello, Mario
>> <Mario_Limonciello@Dell.com>; Andy Shevchenko
>> <andy.shevchenko@gmail.com>; LKML <linux-kernel@vger.kernel.org>;
>> Platform Driver <platform-driver-x86@vger.kernel.org>; Andy Lutomirski
>> <luto@kernel.org>; quasisec@google.com; Pali Roh=C3=A1r <pali.rohar@gmail=
.com>
>> Subject: Re: [PATCH v3 4/8] platform/x86: wmi: create character devices w=
hen
>> requested by drivers
>>=20
>>> On Tue, Oct 3, 2017 at 8:10 AM, Darren Hart <dvhart@infradead.org> wrote=
:
>>>> On Tue, Oct 03, 2017 at 11:23:23AM +0200, Greg KH wrote:
>>>>> On Wed, Sep 27, 2017 at 11:02:16PM -0500, Mario Limonciello wrote:
>>>>> For WMI operations that are only Set or Query read or write sysfs
>>>>> attributes created by WMI vendor drivers make sense.
>>>>>=20
>>>>> For other WMI operations that are run on Method, there needs to be a
>>>>> way to guarantee to userspace that the results from the method call
>>>>> belong to the data request to the method call.  Sysfs attributes don't=

>>>>> work well in this scenario because two userspace processes may be
>>>>> competing at reading/writing an attribute and step on each other's
>>>>> data.
>>>>>=20
>>>>> When a WMI vendor driver declares a set of functions in a
>>>>> file_operations object the WMI bus driver will create a character
>>>>> device that maps to those file operations.
>>>>>=20
>>>>> That character device will correspond to this path:
>>>>> /dev/wmi/$driver
>>>>>=20
>>>>> This policy is selected as one driver may map and use multiple
>>>>> GUIDs and it would be better to only expose a single character
>>>>> device.
>>>>>=20
>>>>> The WMI vendor drivers will be responsible for managing access to
>>>>> this character device and proper locking on it.
>>>>>=20
>>>>> When a WMI vendor driver is unloaded the WMI bus driver will clean
>>>>> up the character device.
>>>>=20
>>>> Ok, thanks to Darren, I've gone and dug these up while my boxes were
>>>> building stable kernels...
>>>>=20
>>>> Why are you not just using the misc device interface here?  Why do you
>>>> need a whole new major and minor range?  Why not just register misc
>>>> devices dynamically as-needed?  Should be much simpler and easier to
>>>> maintain and reduce your code size a lot.
>>>=20
>>> Thank you Greg, this simplifies things quite a bit.
>>>=20
>>> Mario, the misc device interface will remove a lot of the boiler plate
>>> setup and eliminate the need to allocate a new major number.
>>>=20
>>=20
>> In my mind, the problem with misc is that you may end up forever stuck
>> with a misc device, and they're distinct (visibly to userspace) from
>> all other character devices.
>>=20
>> If you really want to be fancy, you could try to dust off a non-awful
>> character device API, a la:
>>=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git/commit/?h=3D=
u2f&i
>> d=3Dd3ab93173d51cebf00dd2263fd0ce9f8cd6258f7
>=20
> That's two years old.  What's the history of it?  Did you try to get it me=
rged?
