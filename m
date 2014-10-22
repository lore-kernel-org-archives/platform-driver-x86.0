From: Giedrius Statkevicius <giedriuswork@gmail.com>
Subject: Re: [PATCH RFC] platform: hp_accel: add a i8042 filter to remove
 accelerometer data
Date: Wed, 22 Oct 2014 16:20:31 +0300
Message-ID: <5447AF1F.1060806@gmail.com>
References: <1413665962-3830-1-git-send-email-giedriuswork@gmail.com> <20141021214508.GF20951@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141021214508.GF20951@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: eric.piel@tremplin-utc.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On 2014.10.22 00:45, Darren Hart wrote:
> On Sat, Oct 18, 2014 at 11:59:22PM +0300, Giedrius Statkevicius wrote=
:
>> Hello,
>=20
> Hi Giedrius,
>=20
>> this patch fixes bug #84941 from the kernel bugzilla. Basically, it
>> seems that the accelerometer sends some signals as button presses
>> through the keyboard bus. The keys in the report are 0xa5-0xa8 but i=
n
>> the filter function they are reported as 0x25-0x28. This patch adds =
a
>=20
> Does this mean you were able to test it? On which platform did you te=
st?
>=20

Sorry for not being specific enough. I have a HP ProBook 4540s laptop
with the sensor in it. It's ACPI id is HPQ6000. The reason I made this
patch is because I've been getting the following problem:

When I move the laptop I noticed that atkbd doesn't recognize some
keyboard "presses" which I wasn't doing and complains about that. The
range of the codes is in the patch: 0x25 - 0x28. The purpose of this
patch is to make hp_accel filter these out from the keyboard data
stream.

I've been testing this patch out on my system for about 5 days and
haven't ran into any issues.

>> i8042 filter that removes these scancodes from the keyboard stream i=
n a
>> similar fashion to how idealpad_sidebar.c does this. I've done a RFC
>> because I'm not sure if there is more portable way to do this and if
>> these codes are the same for all machines. So could please someone
>> respond who uses this driver and tell which invalid keypresses appea=
r
>> (if they do) in your `dmesg` that are reported by atkbd?
>>
>> Also, I'm not sure if there is a publicly available documentation fo=
r hp
>> 3d driveguard (I couldn't find it). That would definetly make it cle=
ar
>> if this patch is correct or not.
>>
>> Adding a signed off by line incase you find this patch good and want=
 to
>> apply it.
>>
>> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>
>=20
> As it appears this is untested and you are looking for testers, I'm g=
oing to
> wait for a Tested-by from someone with hardware. Please follow-up if =
that fails
> to happen.

My questions are these:
- Does any system with the accelerometer whose ACPI id is HPQ0004 or
  HPQ6007 run into the same issues?
- If so, what are the scancodes reported by atkbd?
- If not, then where can I find some documentation to find about this?
  HP doesn't seem to have published any.

If other people have the same issue with the same scancodes on=20
accelerometers with different ACPI ids we can go ahead and do what this
patch does without reacting to what hardware the user has.

And a general question about what other people think of doing this?
Maybe there is some better way I don't know of.

>=20
> More below...
>=20
[...]
>> +static bool hp_accel_i8042_filter(unsigned char data, unsigned char=
 str,
>> +				  struct serio *port)
>> +{
>> +	static bool extended;
>> +
>> +	if (str & I8042_STR_AUXDATA)
>> +		return false;
>> +
>> +	if (data =3D=3D 0xe0) {
>> +		extended =3D true;
>> +		return true;
>=20
> If you are going to return, why bother setting extended?
>=20
>> +	}
>> +
>> +	if (!extended)
>> +		return false;
>=20
> I'm now confused :-)
>=20
>> +
>> +	extended =3D false;
>=20
> Wait... what?
>=20
> Please review the use of extended here as well as the possibility
> of using it uninitialized.
I'll review it and try to write it to be more concise and clearer. To b=
e
honest, I have used drivers/input/misc/ideapad_slidebar.c as a model to
write this function and I didn't like the way it is written. I just
thought: "Hey, this one driver already was checked by someone and does =
a
very similar thing so why reinvent the wheel?"

>=20
>> +	if (likely(data !=3D ACCEL_1) && likely(data !=3D ACCEL_2) &&
>> +	    likely(data !=3D ACCEL_3) && likely(data !=3D ACCEL_4)) {
>> +		serio_interrupt(port, 0xe0, 0);
>> +		return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>>  static int lis3lv02d_add(struct acpi_device *device)
>>  {
>>  	int ret;
>> @@ -326,6 +360,11 @@ static int lis3lv02d_add(struct acpi_device *de=
vice)
>>  	if (ret)
>>  		return ret;
>> =20
>> +	/* filter to remove accelerometer data from keyboard bus stream */
>> +	ret =3D i8042_install_filter(hp_accel_i8042_filter);
>> +	if (ret)
>> +		i8042_remove_filter(hp_accel_i8042_filter);
>=20
> If it failed to install, you don't need to remove it afterward. See
> the implementation for i8042_install_filter().
>=20
Thanks for mentioning this. When we discuss the issues mentioned
previously I'll resend the fixed patch in the canonical and proper form=
=2E

Thanks,
Giedrius
