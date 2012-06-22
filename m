From: Vishal Nandanwar <operational.people-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Need help to understand USB driver mechanism
Date: Fri, 22 Jun 2012 07:35:55 +0530
Message-ID: <CAKB833k1Q7LoJWxDp6AHdq5H=w=LeeeRQ3sRC_1zXcJ_Lp9mNg@mail.gmail.com>
References: <CAKB833mPfX2U6_UA0Fr0CTw623gxCvcYPW3HvfVJWE1Xt7v-UQ@mail.gmail.com>
	<Pine.LNX.4.44L0.1206211036540.1164-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1206211036540.1164-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Linux USB <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Docs <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform driver x86 <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Alan,

Thanks for your reply. It really helps.

What approach one should use to learn the device drivers?

Vishal N

On Thu, Jun 21, 2012 at 8:10 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>=
 wrote:
> On Thu, 21 Jun 2012, Vishal Nandanwar wrote:
>
>> Hi,
>>
>> I am trying to understand the USB device driver writing mechanism an=
d
>> architecture. I have gone through the LDD book as well.
>>
>> For learning purpose I am trying to write a driver for a pen drive
>> i.e. USB mass storage.
>
> That's a terrible way to learn. =A0The mass-storage driver is one of =
the
> most complicated ones in the USB subsystem. =A0You should start with
> something simpler.
>
>> Linux do have the usb-storage driver which is
>> used for pen drive. I have gone through the ../driver/usb/storage
>> folder of Linux source code and found there are few drivers(karma,
>> freecom) which uses usb-storage to achive there functionality.
>
> Yes. =A0Those sub-drivers are needed because their devices don't use =
the
> standard USB mass-storage protocol.
>
>> what is the mechanism to write a driver for pen drive(USB mass
>> storage)? Is there any guide/help document which describes how to
>> create a interface driver on top of usb-storage driver, so when my p=
en
>> driver is connected it should use my driver?
>
> I can tell you in one word how to write a driver for your pen drive:
>
> =A0 =A0 =A0 =A0Don't!
>
> If you don't write a special driver then the pen drive should work
> perfectly well. =A0If you did try to write a special interface sub-dr=
iver
> for it, you'd find that your driver had nothing to do because
> usb-storage already handles everything.
>
> Alan Stern
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
