Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7990C1F12F8;
	Thu, 10 Sep 2026 00:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789001908; cv=none; b=QZLpFmrKwYRhO821wOCFWxanBOkcm8FZ3LF5nFYoqHN1w3O9jlTu0XIqpZj+7/DQGcH7RUl0Ack4VkwpwPHsbOURHVFDUxkDCCmiXjKrFBN22XZFp6N11VMXlkZsjLJ68B+myDLzm2Z+SuVAmKTFXsOPPI5QYx9aB6H4OTOudsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789001908; c=relaxed/simple;
	bh=2uxERaxsDRABh9GF9dd8f6M4ahRiwvT9h1o+7GZ4st4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OIez7+S07tmeKcxXtP+XEYq8cBVxFai6AII1zD8Uq/aAHwPdQFA6LLGV22QU43gRoDFLQlsnsAZJlj7w9MtB94BA7PAVnYqc7o9MXmg2z+gkxy7I6x7cxCs3Z+V9XpMhTEoPnv+KwbCnaGEwC14AenpCGUis+FNEfVyFWPXgaNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Zs4ohYa5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JyVmwBbG; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Zs4ohYa5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JyVmwBbG"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2ADB514000F9;
	Wed,  9 Sep 2026 20:58:25 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 09 Sep 2026 20:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1789001904;
	 x=1789088304; bh=K6DNjnPjoEDDo1rR/RRbUYdqMJLgQ1qziZ4RWOH4NzQ=; b=
	Zs4ohYa5jDnFjzSit400zDhXQLTvgM0kPUy384+TZketjV5OEo64g4SLWWS501D6
	J3TSf0UkHzMUqie/vNwfGX+6labVTaCN/5T1EEfJ1qTicBL9mt8msLmZRAkwUpc4
	CfhuB7qBdGJAxRlco9CE0fhgzmWmiies4Q4DqurXH8bMV+/ME01Znx1vgtTE7CAW
	rM12ghDywUjTXH7B87FX+IZYVcIRkBvaBEg+EHAJhyeo36QBnYgue+89DPK8yLKh
	4oOoW44TtkuxTRmxCTX6g+3DmOzcRKsiCwaqPS3HyOy+sqbm8xII+nPVO2GCbU96
	aFtVsS/H15uKrV8YByr/rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789001904; x=
	1789088304; bh=K6DNjnPjoEDDo1rR/RRbUYdqMJLgQ1qziZ4RWOH4NzQ=; b=J
	yVmwBbGtA0drjlWCiOggk6aXsbd7GsZl29Ic2E81lTC9UAbVrcE01rAUJ/eLCoPm
	2LlNTogeL+gIJAXtNbaXNT0SaFAoxNVWsEpZuRK3FsPs8+7qhIuDke+n5nQ7Xp9J
	3Vbw3f7N4ZGvHjC9DFBI8aCoqGpuXCQlAvOnU0GaB5JAzaRwA5+f9CA3vXEDwr8N
	FvwbhX/krHWViUP4qTiOJpODgUDB+iJPGsqnDjAz0T7OfLpVEu3zKylijFKhGTWx
	Ek6hBPTX+b0I11Xe5SqXAeukjpU7M7UbbaayP9ID6cqxkAYXriMMfwNZcbLBvia1
	h0aG+gYL7us5pMuSMUT4g==
X-ME-Sender: <xms:rwCiav3q-lfoJ7i0j8MUOXv_A_Nb88yW2G-Lq2xKkXxAsnQIDSS9Dg>
    <xme:rwCiao4vwMfwFjytT8C7ryLe5vmY6JY7BdD4hC1pKB1jQWvDuYVRksTggbqhCbb7L
    BlhWhgtgYlFML7ZRF4JA54CkFrxOFr1bKZHi3CLvs6INcY6rnmocg>
X-ME-Proxy-Cause: dmFkZTGUeHbG/5eNRWvKQ3UiOSjgAx84IF3aqhuKWeEkR510EpYqPB966DzaMDGBWwkb/E
    MSvwLVEev4KQ/6AD6XPIhSo7vWmA7snVynuCnHjrHVYZdDSJoVXWxpJDDTyuM4g8hx0lAu
    8REjMRyJfmAhw291goNXIl7ZnsNrRhX9VcaoRhw/fTVkq/sX0ECqXBw3bIsYYVU1hALqrp
    rVVdJO96qwrn3zEvaZWd15lFORXJsZBW6u52nc/pOsNPjRKk3s4qyhL5raXOiJqcPYLtQt
    1wJfthnRptZO5pSoqIVtb0Wv+h/cSk54fbPChU16DR2PGcl90S16QgbgL9F+7d/GONAbgx
    T7zmRT+FzKB49OmdPNN0dvezAD4RyDMLukWyv5Yt1UG7J3l0MavGiNvMVFoMU45kBsstJZ
    baR5hSVN/Ro87/ztfnGMSioOkW3nt93jV5j+YOTADE53/3XXm1LYrGeMg4ADGd2dwgs6Gi
    SsfCMp4YQErYDSsgoegbIQde3Dlq2cZHGGhljT9vV9i9art7gaepN+fUAo47HdLZPLQ4kd
    HNP4SqqeBefiFfaHG0zghS/bjEBsDHSIS/oCGQYvuPW0ozfVUtzlZ4/W7cy/t8OKy7h0rh
    obhZbV1ZpGPwGj9xo6HSJbLlLrnDcFCiGaYZwBScqz+IPa8AVwyIatUPD/rQ
X-ME-Proxy: <xmx:rwCiakHB6RcCx00UvcFz7BfU5EpzzsaPq0xZd7r8DOeMhtPH7WyeQg>
    <xmx:rwCiatxktckD2jE9Hgz7epUw7ya2EI5PXGi70I4VN6Ijb9nrqnppwg>
    <xmx:rwCiau2VsGaabDlPfJj-zKzFtiTMifFcaS-fBAodtZuD0VPUEdrcmQ>
    <xmx:rwCiatqqKpTOCKi8YfQ1_4FYS-IztDH2UBHih3su_qp3RcC-YTZWxA>
    <xmx:sACiaubsbrHCXm4uBarkzrUrcnX9rvdu8yJFoG8DoxOFyIMvca2Kq26_>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 9A0712C00064; Wed,  9 Sep 2026 20:58:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AR8LNQcE3F07
Date: Wed, 09 Sep 2026 20:58:03 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Thorsten Blum" <blum@kernel.org>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <0bd026b6-3fa9-4f62-adf3-ac0a491b6d53@app.fastmail.com>
In-Reply-To: <aqGOLBx_hU3a7ADQ@kernel.org>
References: <20260907090103.352995-3-blum@kernel.org>
 <254d9c60-d21e-4ef5-b70e-89dd18ff7147@app.fastmail.com>
 <aqGOLBx_hU3a7ADQ@kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Remove unreachable code in
 beep_read()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 9, 2026, at 12:49 PM, Thorsten Blum wrote:
> On Wed, Sep 09, 2026 at 11:26:18AM -0400, Mark Pearson wrote:
>> Hi Thorsten,
>> 
>> On Mon, Sep 7, 2026, at 5:01 AM, Thorsten Blum wrote:
>> > The procfs entry /proc/acpi/ibm/beep is only created if beep_init()
>> > succeeds, which requires beep_handle to be non-NULL. Remove the
>> > unreachable code branch from beep_read().
>> >
>> > Signed-off-by: Thorsten Blum <blum@kernel.org>
>> > ---
>> >  drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++------
>> >  1 file changed, 2 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
>> > b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> > index 1082c36ae723..069c9f1c359f 100644
>> > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> > @@ -5936,12 +5936,8 @@ static int __init beep_init(struct 
>> > ibm_init_struct *iibm)
>> > 
>> >  static int beep_read(struct seq_file *m)
>> >  {
>> > -	if (!beep_handle)
>> > -		seq_puts(m, "status:\t\tnot supported\n");
>> > -	else {
>> > -		seq_puts(m, "status:\t\tsupported\n");
>> > -		seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
>> > -	}
>> > +	seq_puts(m, "status:\t\tsupported\n");
>> > +	seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
>> > 
>> >  	return 0;
>> >  }
>> 
>> Change looks good to me.
>> I guess the beep_write could be similarly updated?
>
> No, beep_write() can be called via the beep= module parameter even if
> beep_init() failed, so that check is still needed.
>

Oh - good point, I had missed that.
With that noted:
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks
Mark
