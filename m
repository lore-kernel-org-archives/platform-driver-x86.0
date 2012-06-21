From: Vishal Nandanwar <operational.people@gmail.com>
Subject: Need help to understand USB driver mechanism
Date: Thu, 21 Jun 2012 16:09:18 +0530
Message-ID: <CAKB833mPfX2U6_UA0Fr0CTw623gxCvcYPW3HvfVJWE1Xt7v-UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Linux USB <linux-usb@vger.kernel.org>, Linux Docs <linux-doc@vger.kernel.org>, Platform driver x86 <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

I am trying to understand the USB device driver writing mechanism and
architecture. I have gone through the LDD book as well.

For learning purpose I am trying to write a driver for a pen drive
i.e. USB mass storage. Linux do have the usb-storage driver which is
used for pen drive. I have gone through the ../driver/usb/storage
folder of Linux source code and found there are few drivers(karma,
freecom) which uses usb-storage to achive there functionality.

what is the mechanism to write a driver for pen drive(USB mass
storage)? Is there any guide/help document which describes how to
create a interface driver on top of usb-storage driver, so when my pen
driver is connected it should use my driver?


Vishal N
