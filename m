From: Jorge Pereira <jpereiran@gmail.com>
Subject: Re: [PATCH] Adding support for new keys (ASSIST, WEB and VAIO) of the
	laptop Vaio E Series.
Date: Tue, 18 May 2010 03:56:43 -0300
Message-ID: <AANLkTilC-1Vknft1al4o9eIbv5hzsSJZFsBgvAE3K46O@mail.gmail.com>
References: <AANLkTimzHRev7_RES6KVT3HysQoNdjmTobhoGivqrkMr@mail.gmail.com>
	<AANLkTilYw3bKQpXvQr9JRUqZ6G3uPYDI6ERGiUFlt9rA@mail.gmail.com>
	<AANLkTimYSSglpdSXOffJvYSNK0FxDy3smuiLGrIAX7Cy@mail.gmail.com>
	<20100517221936.GA22300@kamineko.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016e649d79e45c4db0486d8d942
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:36872 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753358Ab0ERG5F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 02:57:05 -0400
Received: by wyb39 with SMTP id 39so1065083wyb.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 May 2010 23:57:03 -0700 (PDT)
In-Reply-To: <20100517221936.GA22300@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Kernel - PlatformDriver-x86 <platform-driver-x86@vger.kernel.org>

--0016e649d79e45c4db0486d8d942
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Mattia,

Great, agree with yours comments and following the new patch.

thanks.
--
Regards,
+--------------------------------------------+
 Jorge Pereira,
 Blog: http://blog.jorgepereira.com.br/
+--------------------------------------------+



On Mon, May 17, 2010 at 7:19 PM, Mattia Dongili <malattia@linux.it> wrote:
> Hi Jorge
>
> On Sun, May 16, 2010 at 03:36:52AM -0300, Jorge Pereira wrote:
>> Hi!
>>
>> =A0Recently i bought the sony laptop model 'VPCEB15FB' and this model
>> has Three buttons top of keyboard[1] that don't work until then.
>> added support to all three keys at the driver sony-laptop.c and sonypi.h
>
> Thanks for the patch, it's fundamentally ok but to be honest I'm not too
> convinced about the naming. I'm not sure how "dedicated" the Web will
> be after you pressed the DEDICATED_WEB button. :)
> Also, you seem to have patched an old version of the driver, please
> make sure the patch applies on current code.
>
> See a couple of comments below.
>
> ...
>> From d2c812270bfce82da57a88c40f43a7eea42ba1f2 Mon Sep 17 00:00:00 2001
>> From: Jorge Pereira <jpereiran@gmail.com>
>> Date: Fri, 14 May 2010 18:18:19 -0300
>> Subject: [PATCH] Adding support for new keys (ASSIST, WEB and VAIO) of t=
he laptop Vaio E Series.
>>
>> ---
>
> Please also Sign-off the patch in your commit log.
>
> ...
>> + =A0 =A0 58, /* 72 SONYPI_EVENT_DEDICATED_SUPPORT */
>> + =A0 =A0 59, /* 73 SONYPI_EVENT_DEDICATED_WEB */
>> + =A0 =A0 60, /* 74 SONYPI_EVENT_DEDICATED_VAIO */
>
> Can't these just be SONYPY_EVENT_ASSIST_PRESSED,
> SONYPI_EVENT_WEB_PRESSED and SONYPI_EVENT_VAIO_PRESSED?
> If necessary you can describe what they were originally inteded to in
> the commit message.
>
> Thanks!
> --
> mattia
> :wq!
>

--0016e649d79e45c4db0486d8d942
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-Adding-support-for-new-keys-ASSIST-WEB-and-VAIO-of-t.patch"
Content-Disposition: attachment;
	filename="0001-Adding-support-for-new-keys-ASSIST-WEB-and-VAIO-of-t.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g9cdeymd0

RnJvbSA1YjhlZjJlNjg4YjY0NDI3YWZiODIyNDNhODBhZjg4MjJlMDYzMTEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb3JnZSBQZXJlaXJhIDxqcGVyZWlyYW5AZ21haWwuY29tPgpE
YXRlOiBUdWUsIDE4IE1heSAyMDEwIDAzOjU2OjA0IC0wMzAwClN1YmplY3Q6IFtQQVRDSF0gQWRk
aW5nIHN1cHBvcnQgZm9yIG5ldyBrZXlzIChBU1NJU1QsIFdFQiBhbmQgVkFJTykgb2YgdGhlIGxh
cHRvcCBWYWlvIEUgU2VyaWVzLgoKLS0tCiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9zb255LWxhcHRv
cC5jIHwgICAxMiArKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvc29ueXBpLmggICAgICAgICAg
ICAgfCAgICAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L3NvbnktbGFwdG9wLmMg
Yi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9zb255LWxhcHRvcC5jCmluZGV4IDEzODdjNWYuLjM1ODBj
YTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L3NvbnktbGFwdG9wLmMKKysrIGIv
ZHJpdmVycy9wbGF0Zm9ybS94ODYvc29ueS1sYXB0b3AuYwpAQCAtMjM1LDYgKzIzNSw5IEBAIHN0
YXRpYyBpbnQgc29ueV9sYXB0b3BfaW5wdXRfaW5kZXhbXSA9IHsKIAk1NywJLyogNzAgU09OWVBJ
X0VWRU5UX1ZPTFVNRV9ERUNfUFJFU1NFRCAqLwogCS0xLAkvKiA3MSBTT05ZUElfRVZFTlRfQlJJ
R0hUTkVTU19QUkVTU0VEICovCiAJNTgsCS8qIDcyIFNPTllQSV9FVkVOVF9NRURJQV9QUkVTU0VE
ICovCisJNTksIC8qIDczIFNPTllQSV9FVkVOVF9BU1NJU1RfUFJFU1NFRCAqLworCTYwLCAvKiA3
NCBTT05ZUElfRVZFTlRfV0VCX1BSRVNTRUQgKi8KKwk2MSwgLyogNzUgU09OWVBJX0VWRU5UX1ZB
SU9fUFJFU1NFRCAqLwogfTsKIAogc3RhdGljIGludCBzb255X2xhcHRvcF9pbnB1dF9rZXljb2Rl
X21hcFtdID0gewpAQCAtMjk3LDYgKzMwMCw5IEBAIHN0YXRpYyBpbnQgc29ueV9sYXB0b3BfaW5w
dXRfa2V5Y29kZV9tYXBbXSA9IHsKIAlLRVlfVk9MVU1FVVAsCS8qIDU2IFNPTllQSV9FVkVOVF9W
T0xVTUVfSU5DX1BSRVNTRUQgKi8KIAlLRVlfVk9MVU1FRE9XTiwJLyogNTcgU09OWVBJX0VWRU5U
X1ZPTFVNRV9ERUNfUFJFU1NFRCAqLwogCUtFWV9NRURJQSwJLyogNTggU09OWVBJX0VWRU5UX01F
RElBX1BSRVNTRUQgKi8KKwlLRVlfSEVMUCwgLyogNTkgU09OWVBJX0VWRU5UX0FTU0lTVF9QUkVT
U0VEICovCisJS0VZX0hPTUVQQUdFLCAvKiA2MCBTT05ZUElfRVZFTlRfV0VCX1BSRVNTRUQgKi8K
KwlLRVlfU0hPUCwgLyogNjEgU09OWVBJX0VWRU5UX1ZBSU9fUFJFU1NFRCAqLwogfTsKIAogLyog
cmVsZWFzZSBidXR0b25zIGFmdGVyIGEgc2hvcnQgZGVsYXkgaWYgcHJlc3NlZCAqLwpAQCAtODk5
LDYgKzkwNSwxMiBAQCBzdGF0aWMgc3RydWN0IHNvbnlfbmNfZXZlbnQgc29ueV8xMDBfZXZlbnRz
W10gPSB7CiAJeyAweDFmLCBTT05ZUElfRVZFTlRfQU5ZQlVUVE9OX1JFTEVBU0VEIH0sCiAJeyAw
eGExLCBTT05ZUElfRVZFTlRfTUVESUFfUFJFU1NFRCB9LAogCXsgMHgyMSwgU09OWVBJX0VWRU5U
X0FOWUJVVFRPTl9SRUxFQVNFRCB9LAorCXsgMHhhNCwgU09OWVBJX0VWRU5UX1dFQl9QUkVTU0VE
IH0sCisJeyAweDI0LCBTT05ZUElfRVZFTlRfQU5ZQlVUVE9OX1JFTEVBU0VEIH0sCisJeyAweGE1
LCBTT05ZUElfRVZFTlRfVkFJT19QUkVTU0VEIH0sCisJeyAweDI1LCBTT05ZUElfRVZFTlRfQU5Z
QlVUVE9OX1JFTEVBU0VEIH0sCisJeyAweGE2LCBTT05ZUElfRVZFTlRfQVNTSVNUX1BSRVNTRUQg
fSwKKwl7IDB4MjYsIFNPTllQSV9FVkVOVF9BTllCVVRUT05fUkVMRUFTRUQgfSwKIAl7IDAsIDAg
fSwKIH07CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc29ueXBpLmggYi9pbmNsdWRlL2xp
bnV4L3NvbnlwaS5oCmluZGV4IDRmOTVjMWEuLjU1MzY5ZDggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgvc29ueXBpLmgKKysrIGIvaW5jbHVkZS9saW51eC9zb255cGkuaApAQCAtMTEyLDYgKzEx
Miw5IEBACiAjZGVmaW5lIFNPTllQSV9FVkVOVF9WT0xVTUVfREVDX1BSRVNTRUQJCTcwCiAjZGVm
aW5lIFNPTllQSV9FVkVOVF9CUklHSFRORVNTX1BSRVNTRUQJCTcxCiAjZGVmaW5lIFNPTllQSV9F
VkVOVF9NRURJQV9QUkVTU0VECQk3MgorI2RlZmluZSBTT05ZUElfRVZFTlRfQVNTSVNUX1BSRVNT
RUQJCTczCisjZGVmaW5lIFNPTllQSV9FVkVOVF9XRUJfUFJFU1NFRAkJNzQKKyNkZWZpbmUgU09O
WVBJX0VWRU5UX1ZBSU9fUFJFU1NFRAkJNzUKIAogLyogZ2V0L3NldCBicmlnaHRuZXNzICovCiAj
ZGVmaW5lIFNPTllQSV9JT0NHQlJUCQlfSU9SKCd2JywgMCwgX191OCkKLS0gCjEuNy4wLjQKCg==
--0016e649d79e45c4db0486d8d942--
